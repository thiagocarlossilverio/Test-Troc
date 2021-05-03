<?php

class TCS_Form_FormCategorias extends Zend_Form {

    public $view = NULL;

    public function init() {
        $viewRenderer = Zend_Controller_Action_HelperBroker::getStaticHelper('ViewRenderer');
        $viewRenderer->init();
        $this->view = $viewRenderer->view;
        $this->setAction('');
        $this->setMethod('post');
        $this->setAttribs(array('id' => 'FormCategorias', 'name' => 'FormCategorias'));
        $this->setAttrib('enctype', 'multipart/form-data');
        $elemento = $this->createElement('hidden', 'id', array('id' => 'id'));
        $elemento->removeDecorator('HtmlTag')->removeDecorator('Label');
        $this->addElement($elemento);

        $elemento = $this->createElement('text', 'nome', array('id' => 'nome', 'Label' => 'Nome *', 'class' => 'form-control'));
        $where = array('table' => 'produto_categorias',
            'field' => 'nome',
            'messages' => "A categoria '%value%' já existe na base de dados."
        );
        // CONDIÃ‡ÃƒO USADA AO EDITAR O REGISTRO
        if (isset($_POST['id']) and $_POST['id'] != '')
            $where[] = 'id != ' . $_POST['id'];
        $elemento->addValidator('Db_NoRecordExists', true, $where)
                ->setAttrib('required', 'required')
                ->setRequired(true)
                ->addDecorator('Description', array('tag' => 'span', 'class' => 'btn', 'id' => 'botGerarCod', 'escape' => false));
        $this->addElement($elemento);

        $elemento = $this->createElement('radio', 'ativo', array('MultiOptions' => array('1' => 'Ativo', '0' => 'Inativo'), 'Label' => 'Ativo', 'class' => 'label_radio'));
        $elemento->setSeparator('');
        $elemento->setValue('1');
        $this->addElement($elemento);
        
        $elemento = $this->createElement('submit', 'Salvar', array('class' => 'btn btn-success'));
        $elemento->removeDecorator('Label');
        $this->addElement($elemento);
        $this->addDisplayGroup(array('id', 'nome', 'ativo', 'Salvar'), 'category', array('removeDecorator' => 'Label'));
        $this->setDisplayGroupDecorators(array('FormElements', 'Fieldset'));
    }

}
