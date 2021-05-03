<?php

class TCS_Form_FormProduto extends Zend_Form {

    public $view = NULL;
    public $imagem = array('y' => '800', 'x' => '800', 'dir' => 'imagens/produtos/');

    public function init() {
        $viewRenderer = Zend_Controller_Action_HelperBroker::getStaticHelper('ViewRenderer');
        $viewRenderer->init();
        $rand = date('YmdHis');
        $this->view = $viewRenderer->view;
        $this->setAction('');
        $this->setMethod('post');
        $this->setAttribs(array('id' => 'TCS_Form_FormProduto', 'name' => 'FormUnidadeAdd'));
        $this->setAttrib('enctype', 'multipart/form-data');
        // ID ................................................................
        $elemento = $this->createElement('hidden', 'id', array('id' => 'id'));
        $elemento->removeDecorator('HtmlTag')->removeDecorator('Label');
        $this->addElement($elemento);


        // VINCULO PARA ARQUIVOS   ....................................................................
        $id = $this->createElement('hidden', 'vinculo', array('id' => 'vinculo', 'value' => $rand));
        $id->removeDecorator('HtmlTag')->removeDecorator('Label');
        $this->addElement($id);

//        $elemento = $this->createElement('radio', 'destaque', array('MultiOptions' => array('1' => 'Sim', '0' => 'Não'), 'Label' => 'Destaque *', 'class' => 'label_radio'));
//        $elemento->setSeparator('');
//        $elemento->setRequired(true);
//        $this->addElement($elemento);

        // categorias .......................................................................
        $categoria = new Admin_Model_Categorias();
        $elemento = $this->createElement('select', 'categoria', array('label' => 'Categoria', 'id' => 'categoria', 'class' => 'form-control'));
        $elemento->addMultioptions(array('' => '-- Selecione uma categoria -- '));
        foreach ($categoria->ListCategory() as $row)
            if ($row['id'])
                $elemento->addMultioptions(array($row['id'] => $row['nome']));

        $this->addElement($elemento);

        $elemento = $this->createElement('text', 'nome', array('id' => 'nome', 'Label' => 'Nome *', 'class' => 'form-control'));
        $elemento->setRequired(true);
        $this->addElement($elemento);

        $elemento = $this->createElement('textarea', 'descricao', array('id' => 'descricao', 'rows' => '10', 'Label' => 'Descrição', 'class' => 'form-control'));
        $this->addElement($elemento);


        $elemento = $this->createElement('text', 'valor', array('id' => 'valor', 'Label' => 'Valor', 'class' => 'form-control'));
        $this->addElement($elemento);


        // Imagens ....................................................................................
        $elemento = $this->createElement('file', 'imagens', array('label' => 'Imagens', 'id' => 'imagens', 'dir' => $this->imagem['dir'], 'rel' => $rand, 'class' => 'multiUpload ' . session_id()));
        try {
            $elemento->setDestination($this->imagem['dir']);
        } catch (Exception $e) {
            mkdir($this->imagem['dir'], 0777);
            $elemento->setDestination($this->imagem['dir']);
        }
        if ($_POST)
            $this->Upload($elemento);
        $this->addElement($elemento);


        $elemento = $this->createElement('radio', 'ativo', array('MultiOptions' => array('1' => 'Sim', '0' => 'Não'), 'Label' => 'Ativo *', 'class' => 'label_radio'));
        $elemento->setSeparator('');
        $elemento->setRequired(true);
        $this->addElement($elemento);

        // Submit  ......................................................................................
        $elemento = $this->createElement('submit', 'Salvar', array('class' => 'btn btn-success'));
        $elemento->removeDecorator('Label');
        $this->addElement($elemento);
        $this->addDisplayGroup(array('id', 'destaque', 'categoria', 'nome', 'descricao', 'valor', 'imagens', 'ativo', 'Salvar'), 'Produto', array('removeDecorator' => 'Label'));
        $this->setDisplayGroupDecorators(array('FormElements', 'Fieldset'));
    }

    public function Upload($campo = NULL) {
        $imagens = new Admin_Model_ProdutoImagens();
        if (isset($_POST['delete']) && $_POST['delete']) {
            $imagens->ApagaIMG("imagem = '" . $_POST['imagem'] . "'", $this->imagem['dir'] . $_POST['imagem']);
            die('IMAGEM DELETADA');
        }
        $config = array('nomeAleatorio' => true);
        $arquivo = Zend_Controller_Action_HelperBroker::getStaticHelper('Upload')->Upload($campo, $config, TRUE);

        if ($arquivo['novoNome']) {
            $imagens->insert(array('imagem' => $arquivo['novoNome'], 'produto' => $_POST['vinculoRand']));
            chmod($this->imagem['dir'] . $arquivo['novoNome'], 0777);
            if (strpos($campo->getAttrib('class'), 'multiUpload') == 0) {
                die($arquivo['novoNome']);
            }
        }
    }

}
