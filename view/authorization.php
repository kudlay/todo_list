<form class="user_form" role="form"  method="post">
    <h2>Log in</h2>
    <div class="form-group">
        <input type="text" onkeyup="validation_auth();" class="form-control input-lg" name="email" id="email" placeholder="Enter login">
    </div>
    <div class="form-group">
        <input type="password" onkeyup="validation_auth();" class="form-control input-lg" name="password" id="pwd" placeholder="Enter password">
    </div>
    <button type="button" id="btn_login" class="btn btn-lg btn-primary btn-block" onclick="Login();" disabled="disabled">Log in</button>
    <div class="reg_link">
        <a href="registration.php">Sign up</a>
    </div>
</form>