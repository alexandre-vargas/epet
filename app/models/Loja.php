<?php
class Loja extends \Phalcon\Mvc\Model {
    public $id;
    public $id_pessoa;
    public $logo;
    public $log_data_insert;
    public $log_data_alt;

    public function initialize() {
        $this->belongsTo("id_pessoa", "Pessoa", "id");
    }

}