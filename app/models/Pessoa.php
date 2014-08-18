<?php
class Pessoa extends \Phalcon\Mvc\Model {
    public $id;
    public $nome;
    public $cpf_cnpj;
    public $cep;
    public $logradouro;
    public $numero;
    public $complemento;
    public $bairro;
    public $cidade;
    public $estado;
    public $email;
    public $ddd_tel1;
    public $tel1;
    public $ddd_tel2;
    public $tel2;

    public function initialize() {
        $this->hasMany("id", "Loja", "id_pessoa");
    }
}