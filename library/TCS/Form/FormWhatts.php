<?php
class TCS_Form_FormWhatts extends Zend_Form {
    public $view = NULL;    // Vou atribuir os Helpers de Visão aqui.
    public function init() {
        // Arquivos de Inicialização Padrão -------------------------------------------------------------------------------------------
        $viewRenderer = Zend_Controller_Action_HelperBroker::getStaticHelper('ViewRenderer');
        $viewRenderer->init();
        $this->view = $viewRenderer->view;
        $this->setAction('');              // Adiciona a Action ao Formulário. Caso não seja declarado, envia para $_SELF
        $this->setMethod('post');             // Define o Metodo.
        $this->setAttribs(array('id' => 'FormWhatts', 'nome' => 'FormWhatts')); // Attribs (Arr com varios) Attrib (Um par de attr e valor)
        $this->setAttrib('enctype', 'multipart/form-data');
        // ID ................................................................
        $elemento = $this->createElement('hidden', 'id', array('id' => 'id'));
        $elemento->removeDecorator('HtmlTag')->removeDecorator('Label');
        $this->addElement($elemento);
         // NICK .........................................................................
        $elemento = $this->createElement('text', 'nome', array('id' => 'nome', 'Label' => 'Nick', 'class' => 'form-control'));
        $elemento->setRequired(true);
        $this->addElement($elemento);
        // DDI  .........................................................................
        $elemento = $this->createElement('text', 'ddi', array('id' => 'ddi', 'Label' => 'DDI', 'class' => 'form-control'));
        $elemento->setRequired(true);
        $this->addElement($elemento);
         // DD .........................................................................
        $elemento = $this->createElement('text', 'dd', array('id' => 'dd', 'Label' => 'DD', 'class' => 'form-control'));
        $elemento->setRequired(true);
        $this->addElement($elemento);
        // Telefone .........................................................................
        $elemento = $this->createElement('text', 'numero', array('id' => 'numero', 'Label' => 'Telefone', 'class' => 'form-control'));
        $elemento->setRequired(true);
        $this->addElement($elemento);
        // Submit  ......................................................................................
        $elemento = $this->createElement('submit', 'Atualizar', array('class'=>'btn btn-success'));
        $elemento->removeDecorator('Label'); //->removeDecorator("DtDdWrapper");
        $this->addElement($elemento);
        $this->addDisplayGroup(array('id', 'nome','ddi', 'dd', 'numero', 'Atualizar'), 'whatts', array('removeDecorator' => 'Label'));
        $this->setDisplayGroupDecorators(array('FormElements', 'Fieldset'));
    }
}
