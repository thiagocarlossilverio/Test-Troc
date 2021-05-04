<?php

class TCS_View_Helpers_SomaCarrinho {

    public function SomaCarrinho($params) {
        if (is_array($params) && count($params) > 0) {
            $total = false;
            
            foreach ($params as  $produto) {
                $valor = $this->view->LimpaNumero($produto['valor']);
                $quantidade = $this->view->LimpaNumero($produto['quantidade']);
                $total += ($quantidade * $valor);
            }

            return $total;
            
        } else {
            return false;
        }
    }

}
