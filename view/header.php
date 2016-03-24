<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="view/css/style.css" />
    <link rel="stylesheet" href="view/css/style_main.css" />
    <link rel="stylesheet" href="view/css/jquery-ui.min.css" />
    <script src="view/js/jquery-ui.min.js"></script>
    <script src="view/js/script.js"></script>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2 col-xs-12">
            <div>
                <?php if(isset($_SESSION["logged_in"])) : ?>
                <div class="user-control">
                    <span><b>User:</b> <?php echo $_SESSION['email']; ?></span>
                    <a class="btn btn-primary btn-xs log_out_btn" href="logout.php">Log out</a>
                </div>
                <?php endif; ?>
                    <div class="logo text-center">
                        <span>Simple TODO List</span>
                        <div class="small">
                            <span>from Ruby Garage</span>
                        </div>
                    </div>