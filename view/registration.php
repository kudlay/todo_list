<form class="user_form" role="form" method="post">
    <h2>Sign up</h2>
    <div class="form-group">
        <input type="email" onkeyup="validation_reg();" class="form-control input-lg" id="email" placeholder="Enter login">
    </div>
    <div class="form-group">
        <input type="password" onkeyup="validation_reg();" class="form-control input-lg" id="pwd" placeholder="Enter password">
    </div>
    <div class="form-group">
        <input type="password" onkeyup="validation_reg();" class="form-control input-lg" id="pwd_c" placeholder="Confirm password">
    </div>
    <button id="button_reg" type="button" onclick="Registration();" class="btn btn-lg btn-primary btn-block" disabled="disabled">Sign up</button>
    <div class="reg_link">
        <a href="login.php">Log in</a>
    </div>
</form>