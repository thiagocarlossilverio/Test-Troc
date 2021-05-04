<?php
class TCS_Form_FormWhattsMensagem extends Zend_Form {
    public $view = NULL;
    public function init() {
        $module = Zend_Controller_Front::getInstance()->getRequest()->getModuleName();
        $viewRenderer = Zend_Controller_Action_HelperBroker::getStaticHelper('ViewRenderer');
        $viewRenderer->init();
        $this->view = $viewRenderer->view;
        $this->setAction('');
        $this->setMethod('post');
        $this->setAttribs(array('id' => 'FormWhattsMensagem', 'name' => 'FormWhattsMensagem', 'enctype' => 'multipart/form-data'));
        $id = $this->createElement('hidden', 'id', array('id' => 'id'));
        $id->removeDecorator('HtmlTag')->removeDecorator('Label');
        $this->addElement($id);
        
        $elemento = $this->createElement('text', 'numero', array('value' => '55','label' => 'Numero', 'id' => 'numero', 'class' => 'form-control'));
        $elemento->setRequired(true);
        $this->addElement($elemento);
        
         $elemento = $this->createElement('textarea', 'mensagem', array('label' => 'Mensagem', 'rows' => '3', 'id' => 'mensagem', 'class' => 'form-control'));
        $this->addElement($elemento);
        
        $elemento = $this->createElement('submit', 'Enviar', array('class' => 'btn btn-success'));
        $elemento->removeDecorator('HtmlTag')->removeDecorator('Label');
        $this->addElement($elemento);
        $this->addDisplayGroup(array('id', 'numero', 'mensagem', 'Enviar'), 'whatts', array('removeDecorator' => 'Label'));
        $this->setDisplayGroupDecorators(array('FormElements', 'Fieldset'));
    }
   
}
