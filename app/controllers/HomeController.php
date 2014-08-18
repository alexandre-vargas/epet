<?php

use Phalcon\Mvc\Controller,
    Phalcon\Mvc\View;

class HomeController extends Controller
{

    public function initialize()
    {
        // $this->view->setTemplateAfter('common');
    }

    public function indexAction()
    {


        $this->view->cache(true);

        // $this->view->pick(array('home/index2'));
        // $this->view->setRenderLevel(View::LEVEL_MAIN_LAYOUT);

        // $this->view->varTeste = 'Alexandre Vargas';


/*        $objPessoa = Pessoa::findFirst();
        foreach($objPessoa->Loja as $loja) {
            print '<pre>';
            print_r($loja);
            die;
        }*/


/*        $loja = Loja::findFirst();
        $pessoa = $loja->getPessoa();

        print '<pre>';
        print_r($pessoa);
        die;*/

    }

}