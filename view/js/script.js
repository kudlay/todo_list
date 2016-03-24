/* click registration button */
function Registration() {
    $.ajax({
        type: "POST",
        url: "controller/base.php",
        data: "email=" + $("#email").val() + "&pwd=" + $("#pwd").val()+ "&pwd_c=" +$("#pwd_c").val()+"&method=registration",
        success:function(msg) {
            if(msg) {
                window.location.replace("index.php");
            }
            else {
                $('#email').parent().addClass('has-error');
                $("#button_reg").attr('disabled', 'disabled');
                alert("this username is already in use");
            }
        }
    });
}

/* click authorization button */
function Login() {
    $.ajax({
        type: "POST",
        url: "controller/base.php",
        data: "email=" + $("#email").val() + "&pwd=" + $("#pwd").val()+"&method=login",
        success:function(msg){
            if(msg) {
                window.location.replace("index.php");
            }
            else {
                alert("incorrect username or password");
            }
        }
    });
}

/* validation of authorization form */
function validation_auth() {
    if ($('#email').val() != "" && $('#pwd').val() != "" && $('#email').val().length > 2 && $('#pwd').val().length > 2) {
        $("#btn_login").removeAttr('disabled');
    }
    else {
        $("#btn_login").attr('disabled', 'disabled');
    }
}

/* validation of registration form */
function validation_reg(){
    $('#email').parent().removeClass('has-error');
    if ($('#email').val() != "" && $('#pwd').val() != "" && $('#pwd_c').val() != "" && $('#email').val().length > 2 && $('#pwd').val().length > 2) {
        if($('#pwd').val() == $('#pwd_c').val()) {
            $("#button_reg").removeAttr('disabled');
        }
        else {
            $("#button_reg").attr('disabled', 'disabled');
        }
    }
}