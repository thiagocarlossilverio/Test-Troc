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
        
          // Nome  .........................................................................
        $elemento = $this->createElement('text', 'nome', array('id' => 'nome', 'Label' => 'Nome', 'class' => 'form-control'));
        $elemento->setRequired(true);
        $this->addElement($elemento);
        
        // Codigo cupom  .........................................................................
        $elemento = $this->createElement('text', 'codigo_cupom', array('id' => 'codigo_cupom', 'Label' => 'Codigo Cupom', 'class' => 'form-control'));
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
        
        // categorias .......................................................................
        $categoria = new Admin_Model_Categorias();
        $elemento = $this->createElement('select', 'categoria', array('label' => 'Por Categoria', 'id' => 'categoria', 'class' => 'form-control'));
        $elemento->addMultioptions(array('' => '-- Selecione uma categoria -- '));
        foreach ($categoria->ListCategory() as $row)
            if ($row['id'])
                $elemento->addMultioptions(array($row['id'] => $row['nome']));

        $this->addElement($elemento);
        
          // Validade  .........................................................................
        $elemento = $this->createElement('text', 'data_validade', array('id' => 'data_validade', 'Label' => 'Validade', 'class' => 'form-control data_time'));
        $this->addElement($elemento);
        
       
        $elemento = $this->createElement('radio', 'ativo', array('MultiOptions' => array('1' => 'Sim', '0' => 'Não'), 'Label' => 'Ativo', 'class' => 'label_radio'));
        $elemento->setSeparator('');
        $elemento->setValue(1);
        $this->addElement($elemento);
        // Submit  ......................................................................................
        $elemento = $this->createElement('submit', 'Salvar', array('class'=>'btn btn-success'));
        $elemento->removeDecorator('Label'); 
        $this->addElement($elemento);
        
        
        
        $this->addDisplayGroup(array('id', 'nome', 'codigo_cupom', 'tipo_desconto', 'desconto', 'categoria', 'data_validade','ativo', 'Salvar'), 'group-desconto', array('removeDecorator' => 'Label'));
        $this->setDisplayGroupDecorators(array('FormElements', 'Fieldset'));
    }
   
    
}
