<?php

class TCS_Form_FormContraProposta extends Zend_Form {

    //public $arquivo = array('y' => '800', 'x' => '800', 'dir' => 'arquivos/anexos/');
    public $view = NULL;

    public function init() {
        $viewRenderer = Zend_Controller_Action_HelperBroker::getStaticHelper('ViewRenderer');
        $viewRenderer->init();
        $this->view = $viewRenderer->view;
        
        $this->setAction('');
        $this->setMethod('post');
        $this->setAttribs(array('id' => 'FormContraProposta', 'name' => 'FormContraProposta', 'enctype' => 'multipart/form-data'));
        $id = $this->createElement('hidden', 'id', array('id' => 'id'));
        $id->removeDecorator('HtmlTag')->removeDecorator('Label');
        $this->addElement($id);

        $resposta = $this->createElement('hidden', 'id', array('id' => 'id'));
        $resposta->removeDecorator('HtmlTag')->removeDecorator('Label');
        $this->addElement($resposta);
        
        $resposta = $this->createElement('hidden', 'nome_cliente', array('id' => 'nome_cliente'));
        $resposta->removeDecorator('HtmlTag')->removeDecorator('Label');
        $this->addElement($resposta);
        
        $resposta = $this->createElement('hidden', 'email_cliente', array('id' => 'email_cliente'));
        $resposta->removeDecorator('HtmlTag')->removeDecorator('Label');
        $this->addElement($resposta);
        
        
        $resposta = $this->createElement('hidden', 'nome_item', array('id' => 'nome_item'));
        $resposta->removeDecorator('HtmlTag')->removeDecorator('Label');
        $this->addElement($resposta);
      
        $elemento = $this->createElement('textarea', 'contra_proposta', array('label' => 'Contra Proposta *', 'rows' => '10', 'id' => 'mensagem', 'class' => 'form-control'));
        $elemento->setRequired(true);
        $this->addElement($elemento);

  
        
        $elemento = $this->createElement('submit', 'Enviar', array('class' => 'btn btn-success'));
        $elemento->removeDecorator('HtmlTag')->removeDecorator('Label');
        $this->addElement($elemento);

        $this->addDisplayGroup(array('id', 'nome_cliente', 'email_cliente', 'nome_item', 'vendedor', 'contra_proposta', 'Enviar'), 'msg', array('removeDecorator' => 'Label', 'class' => 'form-group'));
        $this->setDisplayGroupDecorators(array('FormElements', 'Fieldset'));
    }

    public function Upload($campo = NULL) {
        $config = array('nomeAleatorio' => true);
        $arquivo = Zend_Controller_Action_HelperBroker::getStaticHelper('Upload')->Upload($campo, $config);
        $_POST['arquivo'] = $arquivo['novoNome'];
    }

}
