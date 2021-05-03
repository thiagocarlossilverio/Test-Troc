<?php
class TCS_Form_FormBanner extends Zend_Form {
    public $view = NULL;
    public $marca_agua = TRUE;
    public $imagem = array('y' => '1140', 'x' => '450', 'dir' => 'imagens/banners/');
   
    public function init() {
        // Arquivos de Inicialização Padrão -------------------------------------------------------------------------------------------
        $viewRenderer = Zend_Controller_Action_HelperBroker::getStaticHelper('ViewRenderer');
        $viewRenderer->init();
        $this->view = $viewRenderer->view;
        $this->setAction('');              // Adiciona a Action ao Formulário. Caso não seja declarado, envia para $_SELF
        $this->setMethod('post');             // Define o Metodo.
        $this->setAttribs(array('id' => 'BannersAdd', 'name' => 'BannersAdd')); // Attribs (Arr com varios) Attrib (Um par de attr e valor)
        $this->setAttrib('enctype', 'multipart/form-data');
        // ID ................................................................
        $elemento = $this->createElement('hidden', 'id', array('id' => 'id'));
        $elemento->removeDecorator('HtmlTag')->removeDecorator('Label');
        $this->addElement($elemento);
        
        // titulo  .........................................................................
        $elemento = $this->createElement('text', 'titulo', array('id' => 'titulo', 'Label' => 'Título', 'class' => 'form-control'));
        $elemento->setRequired(true);
        $this->addElement($elemento);
       
        // link  .........................................................................
        $elemento = $this->createElement('text', 'link', array('id' => 'link', 'Label' => 'Link', 'class' => 'form-control'));
        $this->addElement($elemento);
        
        // Imagens ....................................................................................
        $elemento = $this->createElement('file', 'imagem', array('label' => 'Banner', 'id' => 'imagem', 'class' => 'Upload'));
        try {
            $elemento->setDestination($this->imagem['dir']);
        } catch (Exception $e) {
            mkdir($this->imagem['dir']);
            $elemento->setDestination($this->imagem['dir']);
        }
        if ($_POST)
            $this->Upload($elemento);
        $this->addElement($elemento);
        $elemento = $this->createElement('radio', 'ativo', array('MultiOptions' => array('1' => 'Sim', '0' => 'Não'), 'Label' => 'Situação', 'class' => 'label_radio'));
        $elemento->setSeparator('');
        $elemento->setValue(1);
        $this->addElement($elemento);
        // Submit  ......................................................................................
        $elemento = $this->createElement('submit', 'Salvar', array('class'=>'btn btn-success'));
        $elemento->removeDecorator('Label'); //->removeDecorator("DtDdWrapper");
        $this->addElement($elemento);
        $this->addDisplayGroup(array('id', 'titulo', 'subtitulo', 'link','imagem', 'ativo', 'Salvar'), 'banners', array('removeDecorator' => 'Label'));
        $this->setDisplayGroupDecorators(array('FormElements', 'Fieldset'));
    }
   
    public function Upload($campo = NULL) {
        $config = array('imagemX' => $this->imagem['x'], 'imagemY' => $this->imagem['y'], 'nomeAleatorio' => true, 'marca_agua' => $this->marca_agua);
        $arquivo = Zend_Controller_Action_HelperBroker::getStaticHelper('Upload')->Upload($campo, $config, FALSE);
        $_POST['imagem'] = $arquivo['novoNome'];
    }
}
