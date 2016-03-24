<?php
include 'controller/include.php';
if(isset($_SESSION["logged_in"])) {
    include 'view/header.php';
    include 'view/project.php';
    include 'view/footer.php';
}
else {
    header("Location: login.php");
}