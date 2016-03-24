<?php
class user {
    public  $id,$email,$password,$projects;
    public function __constructor($id,$email,$password,$projects) {
        $this->$id= $id;
        $this->$email= $email;
        $this->$password= $password;
        $this->$projects= $projects;
    }
}