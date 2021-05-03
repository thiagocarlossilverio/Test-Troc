<?php
class TCS_Form_FormSeo extends Zend_Form {
    public $view = NULL;
   public function init() {

        $viewRenderer = Zend_Controller_Action_HelperBroker::getStaticHelper('ViewRenderer');
        $viewRenderer->init();
        $this->view = $viewRenderer->view;
        $this->setAction('');
        $this->setMethod('post');             
        $this->setAttribs(array('id' => 'FormSeo', 'name' => 'FormSeo')); 
        $this->setAttrib('enctype', 'multipart/form-data');


        // CONTROLADOR  ................................................................
        $elemento = $this->createElement('select', 'controlador', array('id' => 'controlador', 'label' => 'Controlador', 'class' => 'form-control'));
        $elemento->addMultioptions(array('' => 'Selecione o Controlador'));
        $elemento->addMultioptions($this->getController());
        $this->addElement($elemento);


        // AÇÃO .........................................................................
        $elemento = $this->createElement('select', 'acao', array('id' => 'acao','Label' => 'Ação', 'class' => 'form-control'));
        $elemento->setAttrib('disabled', 'disabled');
        $this->addElement($elemento);

        // META TITLE .........................................................................
        $elemento = $this->createElement('text', 'title', array('label' => 'Page title', 'id' => 'tag_title', 'maxlength' => 255, 'class' => 'form-control'));
        $elemento->addDecorator('Description', array('class' => 'description', 'escape' => false))
                ->setDescription('Máximo 255 caracteres!</p> <i class="infoTip" title="A tag title informa tanto os usuários quanto os mecanismos de pesquisa qual o tema de uma determinada página."></i>');
        $elemento->setRequired(true);
        $this->addElement($elemento);


        // META DESCRIPTION .........................................................................
        $elemento = $this->createElement('textarea', 'description', array('label' => 'Meta description', 'id' => 'meta_description', 'maxlength' => 255, 'class' => 'form-control'));
        $elemento->addDecorator('Description', array('class' => 'description', 'escape' => false))
                ->setDescription('Máximo 255 caracteres!</p> <i class="infoTip" title="Breve descrição do conteúdo do site."></i>');
         $elemento->setRequired(true);
        $this->addElement($elemento);

        // KEYWORDS .........................................................................
        $elemento = $this->createElement('text', 'keywords', array('label' => 'Keywords (tags)', 'id' => 'meta_keywords', 'maxlength' => 255, 'class' => 'form-control'));
        $elemento->addDecorator('Description', array('class' => 'description', 'escape' => false))
                ->setDescription('Máximo 255 caracteres!</p> <i class="infoTip" title="As keywords são palavras-chave separadas por vírgula, que ajudam na busca por assuntos relevantes."></i>');
         $elemento->setRequired(true);
        $this->addElement($elemento);


        // enviar  ......................................................................................
        $elemento = $this->createElement('submit', 'Salvar', array('class' => 'btn btn-success'));
        $elemento->removeDecorator('HtmlTag')->removeDecorator('Label');
        $this->addElement($elemento);
		
        $this->addDisplayGroup(array('controlador', 'acao','title', 'description', 'keywords', 'Salvar'), 'informacoes_seo', array('removeDecorator' => 'Label'));
        $this->setDisplayGroupDecorators(array('FormElements', 'Fieldset'));
    }
  	
	public function getController() {
        $path = APPLICATION_PATH . '/modules/default/controllers/';
        $diretorio = dir($path);
        $arr = array();
        while ($arquivo = $diretorio->read()) {
            if (!is_dir($arquivo) && $arquivo != '.' && $arquivo != '..') {
                $values = str_replace('.php', '', $arquivo);
                $value = explode('Controller', $values);
                //$var = 
                if(strtolower($value[0])!='default' && strtolower($value[0])!='comum' && strtolower($value[0])!='error'){
                $arr[$values] =  strtolower($value[0]);
                }
            }
        }
        $diretorio->close();
        asort($arr);

     
        return $arr;
    }
   
    
    
   
}
