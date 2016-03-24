<?php

require_once 'controller/include.php';

unset($_SESSION["email"]);
unset($_SESSION["id"]);
unset($_SESSION["hash"]);
unset($_SESSION["logged_in"]);
session_destroy();
header("Location: login.php");