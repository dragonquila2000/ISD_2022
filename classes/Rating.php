<?php
require_once('./config.php');
class Rating extends DBConnection
{
    private $productUsersTable = 'product_users';
    private $productTable = 'product';
    private $productRatingTable = 'product_rating';
    private $setting;

    public function __construct(){
        global $_settings;
        $this->settings = $_settings;
        parent::__construct();
    }
    public function __destruct(){
        parent::__destruct();
    }

}