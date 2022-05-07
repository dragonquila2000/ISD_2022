<?php

require_once './config.php';
class ForgetPassword extends DBConnection
{
    private $settings;
    public function __construct(){
        global $_settings;
        $this->settings = $_settings;
        parent::__construct();
    }
    public function __destruct(){
        parent::__destruct();
    }

    public function getUser() {
        $sql = "SELECT * FROM clients";
        $result = $this->conn->query($sql);
        return $result;
    }

    public function getUserEmail($email){
        $sql = "SELECT * FROM clients WHERE email ='$email'";
        $result = $this->conn->query($sql);
        if ($result) {
            return $result;
        } else {
            echo "<h4 style='color: red'> Email không tồn tại</h4> <br>";
        }
    }

    public function forgetPass($pass,$email) {
        $sql = "UPDATE clients SET password = '$pass' WHERE email ='$email'";
        $result = $this->conn->query($sql);
    }
}