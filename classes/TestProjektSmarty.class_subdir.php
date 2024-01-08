<?php
    date_default_timezone_set("Europe/Berlin");

    set_include_path( get_include_path().PATH_SEPARATOR.'./lib');
    require_once('../lib/smarty/libs/Smarty.class.php');
    if(!defined('REQUIRED_SMARTY_DIR')) define('REQUIRED_SMARTY_DIR','./');

    class SmartyAdmin extends Smarty{

        public function __construct(){
            parent::__construct();    // this must be called 
            $this->template_dir = REQUIRED_SMARTY_DIR.'../templates';
            $this->compile_dir   = REQUIRED_SMARTY_DIR.'../templates_c';
            $this->config_dir    = REQUIRED_SMARTY_DIR.'../config';
            $this->cache_dir     = REQUIRED_SMARTY_DIR.'../cache';
        }
    }
?>