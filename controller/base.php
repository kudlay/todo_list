<?php
require_once '../config.php';
require_once '../data/user.php';
require_once '../data/task.php';
require_once '../data/project.php';
include 'include.php';

$method = $_POST["method"];
SelectFunction($method);
function SelectFunction($method) {
    switch($method) {
        case "login":
            Login();
            break;

        case "registration":
            Reg();
            break;

        case "get_project":
            Get_Task();
            break;

        case "delete_project":
            Delete_Project();
            break;

        case "add_project":
            Add_project();
            break;

        case "rename_project":
            Rename_project();
            break;

        case "add_task":
            Add_task();
            break;

        case "del_task":
            Del_task();
            break;

        case "rename_task":
            Rename_task();
            break;

        case "edit_status":
            Edit_status();
            break;

        case "sort":
            Sort_task();
            break;
    }
}
function SelectToDB($query) {
    global $db_host,$db_user,$db_pass,$db_name ;
    $connection=mysql_connect($db_host,$db_user,$db_pass)  or die("CONNECTION ERROR".mysql_error().$db_host );
    mysql_select_db($db_name) or die("CONNECTION2 DATABASE ERROR".mysql_error());
    $rez = mysql_query($query) or die("QUERY ERROR".mysql_error());
    return $rez;
}
function  Login() {
    $email =  $_POST["email"];
    $pwd = $_POST["pwd"];
    if($email != "" && $pwd!= "") {
        $hashedPassword = md5($pwd);
        $result = SelectToDB("SELECT `id` FROM `users` WHERE `email` = '$email' AND `password` = '$hashedPassword'");
        if(mysql_num_rows($result) == 1) {
            $id = mysql_fetch_assoc($result);
            $id = $id['id'];
            $hash = md5(time());
            $time = date('Y-m-d G:i:s');
            SelectToDB("INSERT INTO `sessions` (`hash`, `session_time`, `user_id`) VALUES ('$hash', '$time', $id)");
            $_SESSION['email']=$email;
            $_SESSION['id']=$id;
            $_SESSION['hash']=$hash;
            $_SESSION["logged_in"] = 1;
            echo true;
        }
        else {
            echo  false;
        }
    }
    else {
        echo  false;
    }
}
function  Reg() {
    $email =  $_POST["email"];
    $pwd = $_POST["pwd"];
    $pwd_c = $_POST["pwd_c"];
    if($email != "" && $pwd != "" && $pwd_c != "") {
        if($pwd == $pwd_c) {
            $result = SelectToDB("SELECT `id` FROM `users` WHERE `email` = '$email'");
            if(mysql_num_rows($result) == 1) {
                echo  false;
            }
            else {
                $hashedPassword = md5($pwd);
                SelectToDB("INSERT INTO `users` (`email`, `password`) VALUES ('$email', '$hashedPassword')");
                Login();
                echo true;
            }
        }
        else {
            echo  false;
        }

    }
    else {
        echo  false;
    }
}
function Get_Task() {
    $user_id = $_SESSION['id'];
    if($_SESSION["logged_in"]) {
        $result1 = SelectToDB("SELECT `name`, `id` FROM `projects` WHERE `user_id` = $user_id");
        $user = new user();
        while($r1 = mysql_fetch_assoc($result1)) {
            $projects = new project();
            $projects->name = $r1['name'];
            $projects->id = $r1['id'];
            $projects->id_user = $user_id;
            $result2 = SelectToDB("SELECT `name`, `id`, `status` FROM `tasks` WHERE `project_id` = $projects->id ORDER BY `priority`");
            while($r2 = mysql_fetch_assoc($result2)) {
                $task = new  task();
                $task->id = $r2['id'];
                $task->name = $r2['name'];
                $task->status = $r2['status'];
                $task->project_id = $projects->id;
                $projects->tasks[] = $task;
            }
            $user->projects[] = $projects;
        }
        echo json_encode($user);
    }
}
function Delete_Project() {
    $id = $_POST["id"];
    SelectToDB("DELETE FROM projects WHERE id=$id");
    Get_Task();
}
function Add_project() {
    $msg = array();
    $user_id= $_SESSION["id"];
    $name = $_POST["name"];
    SelectToDB("INSERT INTO `projects` (`name`, `user_id`) VALUES ('$name', $user_id)");
    $id_project=mysql_insert_id();
    $projects = new project();
    $projects->name = $name;
    $projects->id = $id_project;
    $msg['projects'] = $projects;
    echo json_encode($msg);
}
function Rename_project() {
    $name = $_POST["name"];
    $id_project = $_POST["id"];
    SelectToDB("UPDATE `projects` SET `name`='$name' WHERE `id`=$id_project");
}
function Rename_task() {
$name = $_POST["name"];
$id_task = $_POST["id"];
SelectToDB("UPDATE `tasks` SET `name`='$name' WHERE `id`=$id_task");
}
function Add_task() {
    $name = $_POST["name"];
    $id_project = $_POST["id"];
    $result = SelectToDB("SELECT MAX(`priority`)as `priority` FROM `tasks` WHERE `project_id` = $id_project");
    $result = mysql_fetch_assoc($result);
    $priority = 1 + $result['priority'];
    SelectToDB("INSERT INTO `tasks` (`name`, `project_id`, `priority`) VALUES ('$name', $id_project, $priority)");
    Get_Task();
}
function Del_task() {
    $id_task = $_POST["id"];
    SelectToDB("DELETE FROM `tasks` WHERE `id`=$id_task");
    Get_Task();
}
function Edit_status() {
    $id_task = $_POST["id"];
    $status = $_POST["status"];
    echo $status;
    $result = SelectToDB("UPDATE `tasks` SET `status`=$status WHERE `id`=$id_task");
    echo $result;
}
function Sort_task() {
    $arr_task = $_POST["arr"];
    $count = 1;
    foreach($arr_task as $value) {
        SelectToDB("UPDATE `tasks` SET `priority`=$count WHERE `id`=$value");
        $count=$count+1;
    }
}