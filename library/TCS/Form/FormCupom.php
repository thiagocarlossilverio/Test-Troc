<?php
class TCS_Form_FormCupom extends Zend_Form {
    public $view = NULL;
   
   
    public function init() {
        
        // Arquivos de Inicialização Padrão -------------------------------------------------------------------------------------------
        $viewRenderer = Zend_Controller_Action_HelperBroker::getStaticHelper('ViewRenderer');
        $viewRenderer->init();
        $this->view = $viewRenderer->view;
        
        $this->setAction('');              // Adiciona a Action ao Formulário. Caso não seja declarado, envia para $_SELF
        $this->setMethod('post');             // Define o Metodo.
        $this->setAttribs(array('id' => 'CupomAdd', 'name' => 'CupomAdd')); // Attribs (Arr com varios) Attrib (Um par de attr e valor)
        $this->setAttrib('enctype', 'multipart/form-data');
        // ID ................................................................
        $elemento = $this->createElement('hidden', 'id', array('id' => 'id'));
        $elemento->removeDecorator('HtmlTag')->removeDecorator('Label');
        $this->addElement($elemento);
        
        // titulo  .........................................................................
        $elemento = $this->createElement('text', 'nome', array('id' => 'nome', 'Label' => 'Nome', 'class' => 'form-control'));
        $elemento->setRequired(true);
        $this->addElement($elemento);
        
       // Tipo de Desconto .......................................................................
        $categoria = new Admin_Model_Menus();
        $elemento = $this->createElement('select', 'tipo_desconto', array('label' => 'Tipo de Desconto', 'id' => 'tipo_desconto', 'class' => 'form-control'));
        $elemento->addMultioptions(array(
            '' => '-- Selecione o Tipo de Desconto -- ',
            '1'=> 'Percentual',
            '2'=> 'Valor Fixo'
            ));
        $this->addElement($elemento);
       
        // Desconto  .........................................................................
        $elemento = $this->createElement('text', 'desconto', array('id' => 'desconto', 'Label' => 'Desconto', 'class' => 'form-control'));
        $elemento->setRequired(true);
        $this->addElement($elemento);
        
       
        $elemento = $this->createElement('radio', 'ativo', array('MultiOptions' => array('1' => 'Sim', '0' => 'Não'), 'Label' => 'Ativo', 'class' => 'label_radio'));
        $elemento->setSeparator('');
        $elemento->setValue(1);
        $this->addElement($elemento);
        // Submit  ......................................................................................
        $elemento = $this->createElement('submit', 'Salvar', array('class'=>'btn btn-success'));
        $elemento->removeDecorator('Label'); //->removeDecorator("DtDdWrapper");
        $this->addElement($elemento);
        $this->addDisplayGroup(array('id', 'titulo', 'tipo_desconto', 'desconto', 'ativo', 'Salvar'), 'desconto', array('removeDecorator' => 'Label'));
        $this->setDisplayGroupDecorators(array('FormElements', 'Fieldset'));
    }
   
    
}
