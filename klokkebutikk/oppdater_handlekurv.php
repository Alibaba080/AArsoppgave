<?php
session_start();

if (isset($_POST['remove'])) {
    $product_id = $_POST['id'];

    foreach ($_SESSION['cart'] as $key => $item) {
        if ($item['id'] == $product_id) {
            unset($_SESSION['cart'][$key]);
            break;
        }
    }

    // Re-indekserer arrayen etter å ha fjernet et element
    $_SESSION['cart'] = array_values($_SESSION['cart']);
}

header('Location: vis_handlekurv.php');
exit();
?>
