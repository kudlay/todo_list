<?php

class task {
    public  $id,$name,$status, $project_id;
    public function __constructor($id,$name,$status,$project_id) {
        $this->$id= $id;
        $this->$name= $name;
        $this->$status= $status;
        $this->$project_id= $project_id;
    }
}