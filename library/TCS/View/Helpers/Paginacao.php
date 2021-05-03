<?php

class TCS_View_Helpers_Paginacao {

    public function Paginacao($itens, $pagina, $itensPagina) {
        //Pagina atual
        $pagina = intval($pagina);
        //Instancio o zned paginator	  
        $paginator = Zend_Paginator::factory($itens);
        // Seta a quantidade de registros por página
        $paginator->setItemCountPerPage($itensPagina);
        // numero de paginas que serão exibidas
        $paginator->setPageRange(5);
        // Seta a página atual
        $paginator->setCurrentPageNumber($pagina);
        //retorno os dados		
        return $paginator;
    }

}
