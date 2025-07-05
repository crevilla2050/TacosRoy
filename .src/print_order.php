<?php
session_start();
require_once 'db.php';
require_once 'functions.php';

if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit;
}

$orderId = isset($_GET['order_id']) ? intval($_GET['order_id']) : 0;
if ($orderId <= 0) {
    echo "Invalid order ID.";
    exit;
}

// Fetch order info and store info
try {
    // Fetch order info
    $stmtOrder = $pdo->prepare("SELECT o.id_orden_id, o.int_nr_comanda, o.int_mesa, o.chr_status_orden, o.dt_horafecha_orden, t.chr_ticketConsecutivo
        FROM tbl_ordenes o
        LEFT JOIN tbl_ticket_cons t ON t.id_ticketNrConsecutivo = o.int_consecutivo
        WHERE o.id_orden_id = ?");
    $stmtOrder->execute([$orderId]);
    $order = $stmtOrder->fetch(PDO::FETCH_ASSOC);
    if (!$order) {
        echo "Order not found.";
        exit;
    }

    // Fetch store info
    $stmtStore = $pdo->prepare("SELECT * FROM tbl_datos_sucursal WHERE id_sucursal = 1");
    $stmtStore->execute();
    $store = $stmtStore->fetch(PDO::FETCH_ASSOC);

    // Use the new function to calculate order cost and get order details HTML
    require_once 'functions.php';
    list($orderDetailsHtml, $totalAmount) = calculateOrderCostAndDetails($orderId);

    // Convert total amount to words (simple implementation without NumberFormatter)
    function numberToWords($number) {
        $units = ['', 'uno', 'dos', 'tres', 'cuatro', 'cinco', 'seis', 'siete', 'ocho', 'nueve'];
        $tens = ['', 'diez', 'veinte', 'treinta', 'cuarenta', 'cincuenta', 'sesenta', 'setenta', 'ochenta', 'noventa'];
        $teens = ['once', 'doce', 'trece', 'catorce', 'quince', 'dieciséis', 'diecisiete', 'dieciocho', 'diecinueve'];
        $hundreds = ['', 'ciento', 'doscientos', 'trescientos', 'cuatrocientos', 'quinientos', 'seiscientos', 'setecientos', 'ochocientos', 'novecientos'];

        $num = intval($number);
        if ($num == 0) return 'Cero';
        if ($num == 100) return 'Cien';
        if ($num == 100000) return 'Cien mil';

        if ($num < 10) return ucfirst($units[$num]);
        if ($num > 10 && $num < 20) return ucfirst($teens[$num - 11]);
        if ($num < 100) {
            if ($num % 10 == 0) {
                return ucfirst($tens[$num / 10]);
            } else {
                $ten = intval($num / 10);
                $unit = $num % 10;
                return ucfirst($tens[$ten] . ' y ' . $units[$unit]);
            }
        }
        if ($num < 1000) {
            $hundred = intval($num / 100);
            $remainder = $num % 100;
            $hundredText = $hundreds[$hundred];
            if ($remainder == 0) {
                return ucfirst($hundredText);
            } else {
                return ucfirst($hundredText . ' ' . lcfirst(numberToWords($remainder)));
            }
        }
        if ($num < 100000) {
            $thousand = intval($num / 1000);
            $remainder = $num % 1000;
            $thousandText = ($thousand == 1) ? 'Mil' : ucfirst(numberToWords($thousand)) . ' mil';
            if ($remainder == 0) {
                return $thousandText;
            } else {
                return $thousandText . ' ' . lcfirst(numberToWords($remainder));
            }
        }
        // For numbers greater than 100000, fallback to number string
        return ucfirst(strval($num));
    }

    $totalInWords = "";
    if (is_numeric($totalAmount) && floatval($totalAmount) > 0) {
        $totalInWords = numberToWords(floatval($totalAmount)) . " pesos 00/100 M.N.";
    }

} catch (Exception $e) {
    echo "Error fetching order data: " . $e->getMessage();
    exit;
}

// Load template HTML
$templateHtml = file_get_contents('Templates/ticket_template.html');
if ($templateHtml === false) {
    echo "Error loading ticket template.";
    exit;
}

// Replace placeholders
$replacements = [
    '@@DateTime@@' => date('l, Y-m-d H:i'),
    '@@TicketNr@@' => htmlspecialchars($order['chr_ticketConsecutivo']),
    '@@NrMesa@@' => htmlspecialchars($order['int_mesa']),
    '@@NombreSucursal@@' => htmlspecialchars($store['chr_nombre']),
    '@@DatosSuc1@@' => htmlspecialchars($store['chr_dir1']),
    '@@DatosSuc2@@' => htmlspecialchars($store['chr_dir2']),
    '@@DatosSuc3@@' => htmlspecialchars($store['chr_dir3']),
    '@@TelefonoSuc@@' => htmlspecialchars($store['chr_telefono1']),
    '@@DetalleOrden@@' => $orderDetailsHtml,
    '@@TotalLetra@@' => $totalInWords,
    '@@Total@@' => $totalAmount,
];

$outputHtml = str_replace(array_keys($replacements), array_values($replacements), $templateHtml);

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Ticket de Orden</title>
    <style>
        body {
            position: relative;
            font-family: Arial, sans-serif;
        }
        .background-logo {
            position: fixed;
            top: 50px;
            left: 50%;
            transform: translateX(-30%);
            opacity: 0.1;
            width: 300px;
            height: auto;
            z-index: -1;
        }
    </style>
</head>
<body>
    <img src="images/logoTicket.png" alt="Logo Ticket" class="background-logo" />
<?php
echo $outputHtml;
?>
<script>
    function printTicket() {
        // Use a small delay to ensure the page is fully rendered before printing
        setTimeout(() => {
            window.print();
        }, 100);
        // TODO: Implement PDF generation and saving if needed
    }
    function cancelPrint() {
        window.close();
    }
</script>
<div style="text-align: center; margin-top: 20px;">
    <button onclick="printTicket()" style="margin-right: 10px; padding: 10px 20px; font-size: 16px;">Imprimir</button>
    <button onclick="cancelPrint()" style="padding: 10px 20px; font-size: 16px;">Cancelar</button>
</div>
</body>
</html>
