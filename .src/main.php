<?php

//ini_set('display_errors', 1);
//ini_set('display_startup_errors', 1);
//error_reporting(E_ALL);

session_start();
require_once 'db.php';
require_once 'functions.php';

// Check user authentication and authorization
if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit;
}

$error = '';
$orders = [];
$orderDetails = [];
$selectedOrderId = null;
$tables = [];

// Load open orders from database
try {
    $stmt = $pdo->prepare("SELECT o.id_orden_id AS Orden, o.int_nr_comanda AS Comanda, o.dt_horafecha_orden AS Hora, o.int_mesa AS Mesa, o.chr_status_orden AS Status, t.id_ticketNrConsecutivo AS IDTicketNR, t.chr_ticketConsecutivo AS TicketNR FROM tbl_ordenes o LEFT JOIN tbl_ticket_cons t ON t.id_ticketNrConsecutivo = o.int_consecutivo WHERE o.chr_status_orden = 'Abierta' ORDER BY Orden ASC");
    $stmt->execute();
    $orders = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    $error = "Error loading orders: " . $e->getMessage();
}

// Load tables from tbl_mesas
try {
    $stmt = $pdo->prepare("SELECT id_mesa_id, chr_mesa FROM tbl_mesas where bit_mesa_activa = 1 ORDER BY id_mesa_id ASC");
    $stmt->execute();
    $tables = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    $error = "Error loading tables: " . $e->getMessage();
}

// Load active tipos_precios from tbl_tipos_precios
$tiposPrecios = [];
try {
    $stmt = $pdo->prepare("SELECT id_tipo_precio, chr_nombre_precio FROM tbl_tipos_precios WHERE bit_activo = 1 ORDER BY id_tipo_precio ASC");
    $stmt->execute();
    $tiposPrecios = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    $error = "Error loading tipos precios: " . $e->getMessage();
}

// Handle order selection
if (isset($_GET['order_id'])) {
    $selectedOrderId = intval($_GET['order_id']);
    // Load order details
    try {
        $stmt = $pdo->prepare("SELECT `Orden`, `Comahortanda`, `Consecutivo`, `Mesa`, `Cantidad`, `Producto`, `HoraFecha` FROM vw_prods_x_orden WHERE Orden = :order_id AND Activo = 1 ORDER BY HoraFecha ASC");
        $stmt->execute(['order_id' => $selectedOrderId]);
        $orderDetails = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        $error = "Error loading order details: " . $e->getMessage();
    }
}

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Tacos Roy Main</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
if (isset($_SESSION['error']) && $_SESSION['error'] !== '') {
    echo '<div class="alert alert-danger alert-dismissible fade show m-3" role="alert">' .
         htmlspecialchars($_SESSION['error']) .
         '<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
    unset($_SESSION['error']);
}
if (isset($_SESSION['message']) && $_SESSION['message'] !== '') {
    echo '<div class="alert alert-success alert-dismissible fade show m-3" role="alert">' .
         htmlspecialchars($_SESSION['message']) .
         '<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>';
    unset($_SESSION['message']);
}
?>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Tacos Roy</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Inicio</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Productos</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="logout.php">Logout</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<div class="container-fluid mt-3">
    <div class="row">
        <div class="col-md-3">
            <h5>Acciones</h5>
<form method="post" action="actions.php" id="orderForm">
    <input type="hidden" name="selected_table" id="selected_table" value="" />
    <input type="hidden" name="new_order" id="new_order" value="0" />
    <input type="hidden" name="order_id" id="order_id" value="" />
    <input type="hidden" name="table_id" id="table_id" value="" />
    <input type="hidden" name="comanda_number" id="comanda_number" value="" />
    <input type="hidden" name="tipo_precio_id" id="tipo_precio_id" value="" />
    <input type="hidden" name="cancel_order" id="cancel_order" value="" />
    <button type="button" id="btnNuevaOrden" class="btn btn-primary mb-2 w-100">Nueva Orden</button>
    <button type="submit" name="modify_order" class="btn btn-secondary mb-2 w-100" disabled id="btnModifyOrder" onclick="setModifyOrderHiddenFields()">Modificar Orden</button>
    <button type="submit" name="cancel_order" class="btn btn-danger mb-2 w-100" disabled id="btnCancelOrder">Cancelar Orden</button>
<script>
document.addEventListener('DOMContentLoaded', function() {
    const btnCancel = document.getElementById('btnCancelOrder');
    const orderForm = document.getElementById('orderForm');

    btnCancel.addEventListener('click', function(event) {
        event.preventDefault();
        const selectedRow = document.querySelector('.order-row.table-primary');
        if (!selectedRow) {
            alert('Por favor seleccione una orden para cancelar.');
            return;
        }
        const confirmCancel = confirm('¿Está seguro que desea cancelar la orden seleccionada?');
        if (confirmCancel) {
            // Set order_id hidden input from selected row
            const orderId = selectedRow.getAttribute('data-order-id');
            console.log('Cancel order: setting order_id to', orderId);
            document.getElementById('order_id').value = orderId;
            // Set cancel_order hidden input to "1" to indicate cancel action
            document.getElementById('cancel_order').value = "1";
            // Submit the form
            orderForm.submit();
        }
    });

    // Clear cancel_order hidden input on other button clicks to avoid unintended cancel action
    const btnModify = document.getElementById('btnModifyOrder');
    const btnClose = document.getElementById('btnCloseOrder');
    const btnPrint = document.getElementById('btnPrintAccount');

    [btnModify, btnClose, btnPrint].forEach(button => {
        button.addEventListener('click', () => {
            document.getElementById('cancel_order').value = "";
        });
    });
});
</script>
    <button type="button" id="btnCloseOrder" class="btn btn-success mb-2 w-100 disabled" aria-disabled="true" disabled>Cobrar Orden</button>

    <script>
    document.addEventListener('DOMContentLoaded', function() {
        const btnClose = document.getElementById('btnCloseOrder');

        function updateCobrarOrdenLink() {
            const selectedRow = document.querySelector('.order-row.table-primary');
            if (!selectedRow) {
                console.log('No order selected, disabling Cobrar Orden button');
                btnClose.classList.add('disabled');
                btnClose.setAttribute('aria-disabled', 'true');
                btnClose.disabled = true;
                btnClose.dataset.orderId = '';
            } else {
                const orderId = selectedRow.getAttribute('data-order-id');
                console.log('Order selected, enabling Cobrar Orden button with orderId:', orderId);
                btnClose.classList.remove('disabled');
                btnClose.removeAttribute('aria-disabled');
                btnClose.disabled = false;
                btnClose.dataset.orderId = orderId;
            }
        }

        btnClose.addEventListener('click', function(event) {
            event.preventDefault();
            console.log('Cobrar Orden button clicked');
            if (btnClose.disabled) {
                console.log('Button is disabled, ignoring click');
                return;
            }
            const orderId = btnClose.dataset.orderId;
            console.log('Redirecting to cobrar_orden.php with orderId:', orderId);
            if (orderId) {
                window.location.href = 'cobrar_orden.php?orden_id=' + encodeURIComponent(orderId);
            }
        });

        // Update link on order row click
        const orderRows = document.querySelectorAll('.order-row');
        orderRows.forEach(row => {
            row.addEventListener('click', () => {
                updateCobrarOrdenLink();
            });
        });

        // Initialize link state
        updateCobrarOrdenLink();
    });
    </script>
    <button type="button" name="print_account" class="btn btn-info mb-2 w-100" disabled id="btnPrintAccount" onclick="openPrintPreview()">Imprimir Cuenta</button>
</form>

<script>
function openPrintPreview() {
    const selectedRow = document.querySelector('.order-row.table-primary');
    if (!selectedRow) {
        alert('Por favor seleccione una orden para imprimir.');
        return;
    }
    const orderId = selectedRow.getAttribute('data-order-id');
    const url = 'print_order.php?order_id=' + encodeURIComponent(orderId);
    window.open(url, '_blank', 'width=800,height=600,scrollbars=yes');
}
</script>

<!-- Modal for entering comanda number -->
<div class="modal fade" id="comandaModal" tabindex="-1" aria-labelledby="comandaModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <form id="comandaForm" class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="comandaModalLabel">Nueva Orden - Ingresar Número de Comanda</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
      </div>
      <div class="modal-body">
        <div class="mb-3">
          <label for="inputComandaNumber" class="form-label">Número de Comanda</label>
          <input type="text" class="form-control" id="inputComandaNumber" name="inputComandaNumber" required pattern="\d{1,6}" maxlength="6" title="Por favor ingrese un número válido de hasta 6 dígitos">
        </div>
        <div class="mb-3">
          <label for="selectTipoPrecio" class="form-label">Tipo de Precio</label>
          <select class="form-select" id="selectTipoPrecio" name="selectTipoPrecio" required>
            <option value="" selected disabled>Seleccione un tipo de precio</option>
            <?php foreach ($tiposPrecios as $tipo): ?>
              <option value="<?= htmlspecialchars($tipo['id_tipo_precio']) ?>"><?= htmlspecialchars($tipo['chr_nombre_precio']) ?></option>
            <?php endforeach; ?>
          </select>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
        <button type="submit" class="btn btn-primary">Guardar</button>
      </div>
    </form>
  </div>
</div>

<script>
function setModifyOrderHiddenFields() {
    // Set new_order to 0 explicitly for modify_order
    document.getElementById('new_order').value = '0';
    // Set selected_table to empty or appropriate value if needed
    document.getElementById('selected_table').value = '';
    // Set order_id and table_id from selected order row
    const selectedRow = document.querySelector('.order-row.table-primary');
    if (selectedRow) {
        document.getElementById('order_id').value = selectedRow.getAttribute('data-order-id') || '';
        // Get table_id from the "Mesa" column (4th column, zero-based index 3)
        const mesaCell = selectedRow.cells[3];
        if (mesaCell) {
            document.getElementById('table_id').value = mesaCell.textContent.trim();
        } else {
            document.getElementById('table_id').value = '';
        }
    } else {
        document.getElementById('order_id').value = '';
        document.getElementById('table_id').value = '';
    }
}
</script>
            <div id="lblTimer"></div>

            <div id="tablesContainer" class="mt-3" style="display:none;">
                <h6>Seleccione una mesa</h6>
                <?php
                $count = 0;
                echo '<div class="d-flex flex-wrap">';
                foreach ($tables as $table) {
                    echo '<button type="button" class="btn btn-outline-primary m-1" style="width: calc(12.5% - 0.5rem);" data-table-id="' . htmlspecialchars($table['id_mesa_id']) . '">' . htmlspecialchars($table['chr_mesa']) . '</button>';
                    $count++;
                    if ($count % 8 == 0) {
                        echo '</div><div class="d-flex flex-wrap">';
                    }
                }
                echo '</div>';
                ?>
            </div>
        </div>
        <div class="col-md-9">
            <h5>Órdenes Abiertas</h5>
            <table class="table table-striped table-hover" id="ordersTable">
                <thead>
                    <tr>
                        <th>Orden</th>
                        <th>Comanda</th>
                        <th>Hora</th>
                        <th>Mesa</th>
                        <th>Status</th>
                        <th>TicketNR</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($orders as $order): ?>
                    <tr data-order-id="<?= htmlspecialchars($order['Orden'] ?? '') ?>" class="order-row" tabindex="0" role="button" aria-pressed="false">
                        <td><?= htmlspecialchars($order['Orden'] ?? '') ?></td>
                        <td><?= htmlspecialchars($order['Comanda'] ?? '') ?></td>
                        <td><?= htmlspecialchars($order['Hora'] ?? '') ?></td>
                        <td><?= htmlspecialchars($order['Mesa'] ?? '') ?></td>
                        <td><?= htmlspecialchars($order['Status'] ?? '') ?></td>
                        <td><?= htmlspecialchars($order['TicketNR'] ?? '') ?></td>
                    </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>

            <h5 id="orderDetailsTitle" style="display:none;">Detalles de la Orden</h5>
            <div id="orderDetailsInfo"></div>
            <table class="table table-bordered table-sm" id="orderDetailsTable" style="display:none;">
                <thead>
                    <tr id="orderDetailsHeaderRow"></tr>
                </thead>
                <tbody id="orderDetailsBody"></tbody>
            </table>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
document.addEventListener('DOMContentLoaded', function() {
    const orderRows = document.querySelectorAll('.order-row');
    const btnModify = document.getElementById('btnModifyOrder');
    const btnCancel = document.getElementById('btnCancelOrder');
    const btnClose = document.getElementById('btnCloseOrder');
    const btnPrint = document.getElementById('btnPrintAccount');

    function clearOrderDetails() {
        document.getElementById('orderDetailsTitle').style.display = 'none';
        document.getElementById('orderDetailsInfo').innerHTML = '';
        document.getElementById('orderDetailsTable').style.display = 'none';
        document.getElementById('orderDetailsHeaderRow').innerHTML = '';
        document.getElementById('orderDetailsBody').innerHTML = '';
    }

    function renderOrderDetails(data) {
        console.log('Rendering order details');
        if (!data || !data.orderDetails || data.orderDetails.length === 0) {
            clearOrderDetails();
            alert('No details found for this order.');
            return;
        }

        const orderDetailsTitle = document.getElementById('orderDetailsTitle');
        const orderDetailsInfo = document.getElementById('orderDetailsInfo');
        const orderDetailsTable = document.getElementById('orderDetailsTable');
        const orderDetailsHeaderRow = document.getElementById('orderDetailsHeaderRow');
        const orderDetailsBody = document.getElementById('orderDetailsBody');

        orderDetailsTitle.style.display = 'block';

        // Show Mesa and Comanda from first detail row
        const firstDetail = data.orderDetails[0];
        orderDetailsInfo.innerHTML = '<label><strong>Mesa:</strong> ' + firstDetail.Mesa + '</label>&nbsp;&nbsp;<label><strong>Comanda:</strong> ' + firstDetail.Comanda + '</label>';

        // Clear previous table content
        orderDetailsHeaderRow.innerHTML = '';
        orderDetailsBody.innerHTML = '';

        // Determine columns to show (exclude Mesa and Comanda)
        const columns = Object.keys(firstDetail).filter(col => col !== 'Mesa' && col !== 'Comanda');

        // Create header row
        columns.forEach(col => {
            const th = document.createElement('th');
            th.textContent = col;
            orderDetailsHeaderRow.appendChild(th);
        });

        // Create body rows
        data.orderDetails.forEach(detail => {
            const tr = document.createElement('tr');
            columns.forEach(col => {
                const td = document.createElement('td');
                td.textContent = detail[col];
                tr.appendChild(td);
            });
            orderDetailsBody.appendChild(tr);
        });

        orderDetailsTable.style.display = 'table';
    }

    orderRows.forEach(row => {
        row.addEventListener('click', () => {
            console.log('Order row clicked');
            orderRows.forEach(r => r.classList.remove('table-primary'));
            row.classList.add('table-primary');
            const orderId = row.getAttribute('data-order-id');
            console.log('Selected orderId:', orderId);
            // Enable buttons when an order is selected
            btnModify.disabled = false;
            btnCancel.disabled = false;
            btnClose.disabled = false;
            btnPrint.disabled = false;

            // Fetch order details via AJAX
            fetch('get_order_details.php?order_id=' + encodeURIComponent(orderId))
                .then(response => {
                    console.log('Fetch response status:', response.status);
                    return response.json();
                })
                .then(data => {
                    console.log('Fetch data received:', data);
                    if (data.error) {
                        alert('Error: ' + data.error);
                        clearOrderDetails();
                    } else {
                        renderOrderDetails(data);
                    }
                })
                .catch(error => {
                    alert('Error fetching order details: ' + error);
                    clearOrderDetails();
                });
        });
    });

    // On page load, clear order details and disable buttons
    clearOrderDetails();
    btnModify.disabled = true;
    btnCancel.disabled = true;
    btnClose.disabled = true;
    btnPrint.disabled = true;

    const btnNuevaOrden = document.getElementById('btnNuevaOrden');
    const tablesContainer = document.getElementById('tablesContainer');
    const selectedTableInput = document.getElementById('selected_table');
    const orderForm = document.getElementById('orderForm');

btnNuevaOrden.addEventListener('click', () => {
        // Show the comanda number modal instead of toggling tables container
        const comandaModal = new bootstrap.Modal(document.getElementById('comandaModal'));
        comandaModal.show();
    });

    // Handle comanda form submission
    const comandaForm = document.getElementById('comandaForm');
    comandaForm.addEventListener('submit', (event) => {
        event.preventDefault();
        const inputComandaNumber = document.getElementById('inputComandaNumber').value.trim();
        if (!inputComandaNumber.match(/^\d{1,6}$/)) {
            alert('Por favor ingrese un número de comanda válido de hasta 6 dígitos.');
            return;
        }
    // Set hidden input value
    document.getElementById('comanda_number').value = inputComandaNumber;
    // Set hidden input for tipo_precio_id
    const tipoPrecioSelect = document.getElementById('selectTipoPrecio');
    const selectedTipoPrecio = tipoPrecioSelect ? tipoPrecioSelect.value : '';
    if (!selectedTipoPrecio) {
        alert('Por favor seleccione un tipo de precio.');
        return;
    }
    document.getElementById('tipo_precio_id').value = selectedTipoPrecio;
    // Set new_order to 1 for new order creation
    document.getElementById('new_order').value = '1';
    // Hide modal
    const comandaModalEl = document.getElementById('comandaModal');
    const comandaModal = bootstrap.Modal.getInstance(comandaModalEl);
    comandaModal.hide();
    // Show tables container
    const tablesContainer = document.getElementById('tablesContainer');
    tablesContainer.style.display = 'block';

    // Debug logs before waiting for table selection
    console.log('Waiting for table selection with values:');
    console.log('comanda_number:', document.getElementById('comanda_number').value);
    console.log('tipo_precio_id:', document.getElementById('tipo_precio_id').value);
    console.log('new_order:', document.getElementById('new_order').value);
    });

    // Use event delegation for table buttons inside tablesContainer
    tablesContainer.addEventListener('click', (event) => {
        const target = event.target;
        if (target.classList.contains('btn-outline-primary')) {
            const tableId = target.getAttribute('data-table-id');
            console.log('Table button clicked, tableId:', tableId);
            if (tableId) {
                // Set hidden input for table_id (int_mesa)
                document.getElementById('table_id').value = tableId;
                // Submit the main form to send data to actions.php
                document.getElementById('orderForm').submit();
            }
        }
    });
});
function updateClock() {
    const now = new Date();
    const timeString = now.toLocaleTimeString();
    const lblTimer = document.getElementById('lblTimer');
    if (lblTimer) {
        lblTimer.textContent = timeString;
    }
}

document.addEventListener('DOMContentLoaded', () => {
    updateClock(); // initial call
    setInterval(updateClock, 1000); // update every second
});
</script>

</body>
</html>
