<?php
class TCS_Form_FormWhattsCode extends Zend_Form {
    public $view = NULL;    // Vou atribuir os Helpers de Visão aqui.
    public function init() {
        // Arquivos de Inicialização Padrão -------------------------------------------------------------------------------------------
        $viewRenderer = Zend_Controller_Action_HelperBroker::getStaticHelper('ViewRenderer');
        $viewRenderer->init();
        $this->view = $viewRenderer->view;
        $this->setAction('');              // Adiciona a Action ao Formulário. Caso não seja declarado, envia para $_SELF
        $this->setMethod('post');             // Define o Metodo.
        $this->setAttribs(array('id' => 'FormWhattsCode', 'nome' => 'FormWhattsCode')); // Attribs (Arr com varios) Attrib (Um par de attr e valor)
        $this->setAttrib('enctype', 'multipart/form-data');
        // ID ................................................................
        $elemento = $this->createElement('hidden', 'id', array('id' => 'id'));
        $elemento->removeDecorator('HtmlTag')->removeDecorator('Label');
        $this->addElement($elemento);
         // NICK .........................................................................
        $elemento = $this->createElement('text', 'code', array('id' => 'code', 'Label' => 'Código', 'class' => 'form-control'));
        $elemento->setRequired(true);
        $this->addElement($elemento);
        // Submit  ......................................................................................
        $elemento = $this->createElement('submit', 'Finalizar', array('class'=>'btn btn-success'));
        $elemento->removeDecorator('Label'); //->removeDecorator("DtDdWrapper");
        $this->addElement($elemento);
        $this->addDisplayGroup(array('id', 'code', 'Finalizar'), 'whatts', array('removeDecorator' => 'Label'));
        $this->setDisplayGroupDecorators(array('FormElements', 'Fieldset'));
    }
}
