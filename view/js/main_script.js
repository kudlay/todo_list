$(document).ready(function() {
    $.ajax({
        type: "POST",
        url: "controller/base.php",
        data: "&method=get_project",
        success:function(msg) {
            Get_All_User_Projects(msg);
        }
    });

});
function Get_All_User_Projects(msg) {
    var res = JSON.parse(msg);
    Task_status(res);
    $(".projects_container").html(Mustache.render($('#template').html(), res));
    Sort();
    Resize();
}
function Task_status(res) {
    res.Status_task = function (){return (this.status==1)? "checked" : "";};
}
function Resize() {
    $('textarea').each(function () {
        this.setAttribute('style', 'height:' + (this.scrollHeight) + 'px;overflow: hidden;');
    }).on('input', function () {
        this.style.height = 'auto';
        this.style.height = (this.scrollHeight) + 'px';
    });
}
function Sort() {
    var fixHelper = function(e, ui) {
        ui.children().each(function() {
            $(this).width($(this).width());
        });
        return ui;
    };
    $('tbody').sortable( {
        handle: '.task-move',
        axis: 'y',
        helper: fixHelper,
        update: function () {
            var s = $(this).sortable("toArray");
            $.ajax({
                type: "POST",
                url: "controller/base.php",
                data: {arr:s,method:"sort"},
                success:function(msg) {
                }
            });
        }
    });
}
function project_edit(e) {
    var el = $(e).closest('.input-group').children('.project_name');
    el.removeAttr('disabled');
    $(".project_control").children('span').hide();
    el.focus();
    $('#add_project').attr('disabled','disabled');
}
function Save_add_project(name) {
    if(name.length>0) {
        $.ajax({
            type: "POST",
            url: "controller/base.php",
            data: "name="+name+"&method=add_project",
            success:function(msg) {
                var res = JSON.parse(msg);
                $(".delete_after").remove();
                $(".projects_container").append(Mustache.render($('#template').html(), res));
                $('#add_project').removeAttr('disabled');
            }
        });
    }
    else {
        $(".delete_after").remove();
        $('#add_project').removeAttr('disabled','disabled');
    }

}
function Lost_focus(e) {
    if($(e).val() != "") {
        $(e).attr('disabled', 'disabled');
        $('#add_project').removeAttr('disabled');
        $(".project_control").children('span').show();
    }
}
function Change_name(e, $id, $method) {
    if($(e).val() != "") {
        $.ajax({
            type: "POST",
            url: "controller/base.php",
            data: "id="+$id+"&name="+$(e).val()+"&method="+$method,
            success:function() {
                $('#add_project').removeAttr('disabled');
            }
        });
    }
}
function project_delete ($id) {
    $.ajax({
        type: "POST",
        url: "controller/base.php",
        data: "id="+$id+"&method=delete_project",
        success:function(msg) {
            Get_All_User_Projects(msg);
        }
    });
}
function Add_project() {
    $('#add_project').attr('disabled','disabled');
    var json = {projects:[{"name":""}]};
    $(".projects_container").append(Mustache.render($('#template_add_project').html(), json));
    $('.project_name_add').focus();
}
function Validation_task(e) {
    if($(e).val() != "") {
        $(e).parent().find('.add_task_btn').removeAttr('disabled', 'disabled');
    }
    else {
        $(e).parent().find('.add_task_btn').attr('disabled', 'disabled');
    }
}
function Add_task(e, $id) {
    var name = $(e).parents('.input-group').children('.add_task_name').val();
    $.ajax({
        type: "POST",
        url: "controller/base.php",
        data: "id="+$id+"&name="+name+"&method=add_task",
        success:function(msg) {
            Get_All_User_Projects(msg);
        }
    });
}
function Task_del($id) {
    $.ajax({
        type: "POST",
        url: "controller/base.php",
        data: "id="+$id+"&method=del_task",
        success:function(msg) {
            Get_All_User_Projects(msg);
        }
    });
}
function Task_edit(e) {
    var el = $(e).closest('tr').find('.task_name');
    el.removeAttr('disabled');
    $(".project_control").children('span').hide();
    el.focus();
    $('#add_project').attr('disabled','disabled');
}
function Edit_status(e, $task_id) {
    var status = $(e).prop("checked");
    if(status) {
        $(e).closest('tr').find('.task_name').addClass('checked');
    }
    else {
        $(e).closest('tr').find('.task_name').removeClass('checked');
    }
    $.ajax({
        type: "POST",
        url: "controller/base.php",
        data: "id="+$task_id+"&status="+status+"&method=edit_status",
        success:function(msg) {

        }
    });
}
function Press_enter(key_code, e){
    if (key_code==13) {
        Lost_focus(e)
    }
}