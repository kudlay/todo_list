<?php
class project {
    public  $id,$name,$id_user, $tasks;
    public function __constructor($id,$name,$id_user) {
        $this->$id= $id;
        $this->$name= $name;
        $this->$id_user= $id_user;
    }
}