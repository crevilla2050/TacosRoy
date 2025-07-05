<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

/**
 * Obtains the last id_control_fecha from tbl_control_fechas and stores it in a session variable.
 *
 * @return int|false The id_control_fecha if found, false otherwise.
 */
function getAndStoreLastControlFechaId() {
    // Include database connection
    require_once 'db.php';

    global $pdo;

    try {
        // Get the last control fecha record
        $stmt = $pdo->query("SELECT * FROM tbl_control_fechas ORDER BY id_control_fechas DESC LIMIT 1");
        $result = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($result && isset($result['id_control_fechas'])) {
            // Start session if not started
            if (session_status() === PHP_SESSION_NONE) {
                session_start();
            }

            // Check if turno is open or closed
            if (is_null($result['dt_finaliza_labores'])) {
                // Turno is open, check if it should be closed based on duration
                $start = new DateTime($result['dt_comienzo_labores']);
                $now = new DateTime();
                $interval = $start->diff($now);
                $hoursPassed = $interval->h + ($interval->days * 24);

                $maxTurnoHours = 12; // Adjust as needed

                if ($hoursPassed > $maxTurnoHours) {
                    // Close turno
                    $updateStmt = $pdo->prepare("UPDATE tbl_control_fechas SET dt_finaliza_labores = NOW() WHERE id_control_fechas = :id");
                    $updateStmt->execute(['id' => $result['id_control_fechas']]);
                    // Optionally, create backup or other actions here
                    $_SESSION['id_control_fecha'] = 0;
                    return 0;
                } else {
                    // Turno still open
                    $_SESSION['id_control_fecha'] = $result['id_control_fechas'];
                    return $result['id_control_fechas'];
                }
            } else {
                // Turno is closed, ask if new turno should be opened (cannot do interactive in PHP)
                // For now, automatically open new turno
                $insertStmt = $pdo->prepare("INSERT INTO tbl_control_fechas (dt_fecha_calendario, dt_comienzo_labores) VALUES (CURDATE(), NOW())");
                $insertStmt->execute();
                $newId = $pdo->lastInsertId();
                $_SESSION['id_control_fecha'] = $newId;
                return $newId;
            }
        } else {
            // No control fecha found, create a new one
            $insertStmt = $pdo->prepare("INSERT INTO tbl_control_fechas (dt_fecha_calendario, dt_comienzo_labores) VALUES (CURDATE(), NOW())");
            $success = $insertStmt->execute();
            if (!$success) {
                error_log('Failed to insert new control fecha record in getAndStoreLastControlFechaId()');
            }
            $newId = $pdo->lastInsertId();
            $_SESSION['id_control_fecha'] = $newId;
            return $newId;
        }
    } catch (PDOException $e) {
        error_log('PDOException in getAndStoreLastControlFechaId(): ' . $e->getMessage());
        return false;
    }

}
/**
 * Get control fechas between start and end dates.
 * 
 * @param string $startDate Date string in 'Y-m-d' format
 * @param string|null $endDate Optional end date string in 'Y-m-d' format
 * @return array Associative array with keys 'start' and 'end' control fecha IDs, or null if none found
 */
function getControlFechas($startDate, $endDate = null) {
    require_once 'db.php';
    global $pdo;

    if ($endDate === null) {
        $endDate = $startDate;
    }

    try {
        $stmt = $pdo->prepare("SELECT * FROM tbl_control_fechas WHERE DATE(dt_fecha_calendario) >= :startDate AND DATE(dt_fecha_calendario) <= :endDate ORDER BY id_control_fechas ASC");
        $stmt->execute(['startDate' => $startDate, 'endDate' => $endDate]);
        $results = $stmt->fetchAll(PDO::FETCH_ASSOC);

        if ($results && count($results) > 0) {
            $startId = $results[0]['id_control_fechas'];
            $endId = $results[count($results) - 1]['id_control_fechas'];
            return ['start' => $startId, 'end' => $endId];
        } else {
            return null;
        }
    } catch (PDOException $e) {
        // Handle exception or log error as needed
        return null;
    }
}

/**
 * Calculate the cost and build order details HTML for a given order ID.
 *
 * @param int $orderId The order ID.
 * @return array An array with two elements: [0] => HTML string of order details rows, [1] => total amount as string.
 */
function calculateOrderCostAndDetails(int $orderId): array {
    require_once 'db.php';
    global $pdo;

    $htmlRows = '';
    $totalAmount = 0.0;

    try {
        // Get price type for the order
        $stmt = $pdo->prepare("SELECT * FROM tbl_precio_tipo_ordenes WHERE id_orden = ?");
        $stmt->execute([$orderId]);
        $priceTypeRow = $stmt->fetch(PDO::FETCH_ASSOC);
        $priceTypeId = $priceTypeRow ? intval($priceTypeRow['id_tipo_precio']) : 1;

        // Query order details with joins, using vw_productos_con_precio for product info and price
        $query = "
            SELECT DISTINCT
                pxo.int_orden_id AS Orden,
                pxo.id_prod_x_orden AS IDPO,
                o.int_nr_comanda AS Comanda,
                tc.chr_ticketConsecutivo AS Consecutivo,
                m.chr_mesa AS Mesa,
                vpc.id_producto AS IDProd,
                vpc.chr_nombre_prod AS Producto,
                pxo.int_cantidad AS Cantidad,
                tp.id_tipo_precio AS TipoPrecio,
                tp.chr_nombre_precio AS CHRTipoPrecio,
                o.dt_horafecha_orden AS HoraFecha,
                o.id_control_fecha AS ControlFecha,
                pxo.bool_activo AS Activo,
                pxo.bool_impreso AS Impreso,
                vpc.fl_ordenar AS Ordenar,
                vpc.precio_actual AS Precio
            FROM tbl_prods_x_orden pxo
            LEFT JOIN tbl_ordenes o ON o.id_orden_id = pxo.int_orden_id
            LEFT JOIN vw_productos_con_precio vpc ON pxo.int_producto_id = vpc.id_producto
            LEFT JOIN tbl_precio_tipo_ordenes pto ON pxo.int_orden_id = pto.id_orden
            LEFT JOIN tbl_tipos_precios tp ON tp.id_tipo_precio = pto.id_tipo_precio
            LEFT JOIN tbl_ticket_cons tc ON o.int_consecutivo = tc.id_ticketNrConsecutivo
            LEFT JOIN tbl_mesas m ON m.id_mesa_id = o.int_mesa
            WHERE pxo.int_orden_id = ?
            ORDER BY o.id_control_fecha
        ";
        $stmtDetails = $pdo->prepare($query);
        $stmtDetails->execute([$orderId]);
        $orderDetails = $stmtDetails->fetchAll(PDO::FETCH_ASSOC);

        foreach ($orderDetails as $detail) {
            $quantity = intval($detail['Cantidad']);
            $product = htmlspecialchars($detail['Producto']);
            $price = floatval($detail['Precio'] ?? 0);

            // Check for active promotions
            $promoQuery = "SELECT * FROM tbl_promociones WHERE id_producto = ? AND bit_activo = 1";
            $stmtPromo = $pdo->prepare($promoQuery);
            $stmtPromo->execute([$detail['IDProd']]);
            $promo = $stmtPromo->fetch(PDO::FETCH_ASSOC);

            $finalPrice = $price * $quantity;

            if ($promo) {
                // Check if promotion is valid today (assuming chr_dias_valido is a string with 7 chars for days)
                $dayOfWeek = date('N'); // 1 (Mon) to 7 (Sun)
                if (isset($promo['chr_dias_valido']) && strlen($promo['chr_dias_valido']) >= $dayOfWeek) {
                    if ($promo['chr_dias_valido'][$dayOfWeek - 1] === '1') {
                        $discount = floatval($promo['fl_descuento']);
                        $finalPrice = $finalPrice - ($finalPrice * $discount);
                    }
                }
            }

            // Add extra costs for variants
            $extraCost = 0.0;
            $optionQuery = "SELECT * FROM tbl_prods_orden_opciones WHERE id_prod_x_orden = ?";
            $stmtOptions = $pdo->prepare($optionQuery);
            $stmtOptions->execute([$detail['IDPO']]);
            $options = $stmtOptions->fetchAll(PDO::FETCH_ASSOC);

            foreach ($options as $option) {
                $variantQuery = "SELECT * FROM tbl_prods_variantes WHERE id_producto = ? AND id_variante = ? AND int_activo = 1 ORDER BY id_producto, id_variante";
                $stmtVariant = $pdo->prepare($variantQuery);
                $stmtVariant->execute([$detail['IDProd'], $option['id_variante_platillo']]);
                $variants = $stmtVariant->fetchAll(PDO::FETCH_ASSOC);

                foreach ($variants as $variant) {
                    $costDetailQuery = "SELECT * FROM tbl_costos_extra_var_prod WHERE id_producto_variante = ?";
                    $stmtCostDetail = $pdo->prepare($costDetailQuery);
                    $stmtCostDetail->execute([$variant['id_prods_variantes']]);
                    $costDetails = $stmtCostDetail->fetchAll(PDO::FETCH_ASSOC);

                    foreach ($costDetails as $costDetail) {
                        if (intval($costDetail['id_tipo_precio']) === $priceTypeId) {
                            $extraCost += floatval($costDetail['fl_costo_extra']) * $quantity;
                        }
                    }
                }
            }

            $finalPrice += $extraCost;

            // Determine row style based on active status
            $rowStyle = intval($detail['Activo']) === 1 ? 'font-size: medium;' : 'font-size: medium; text-decoration: line-through;';

            // Build HTML row
            $htmlRows .= "<tr style=\"$rowStyle\">";
            $htmlRows .= "<td align=\"center\" width=\"20%\">{$quantity} x </td>";
            $htmlRows .= "<td width=\"65%\">{$product}</td>";
            $htmlRows .= "<td align=\"right\" width=\"15%\">$ " . number_format($finalPrice, 2) . "</td>";
            $htmlRows .= "</tr>";

            $totalAmount += $finalPrice;
        }

        return [$htmlRows, number_format($totalAmount, 2)];
    } catch (PDOException $e) {
        error_log('PDOException in calculateOrderCostAndDetails(): ' . $e->getMessage());
        return ['', '0.00'];
    }
}
