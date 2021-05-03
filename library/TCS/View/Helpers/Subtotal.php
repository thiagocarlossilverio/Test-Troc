<?php
class TCS_View_Helpers_Subtotal {
    public function Subtotal($produto) {
        if ($produto) {
            $total = 0;
            if ($produto['desconto'] > 0.00) {
                if ($produto['data_inicio_promocao'] != '0000-00-00' && $produto['data_fim_promocao'] != '0000-00-00') {
                    if (date("Y-m-d") >= $produto['data_inicio_promocao'] && date("Y-m-d") <= $produto['data_fim_promocao']) {
                        
                        $total += ($produto['preco_venda'] - $produto['desconto']);
                    } else {
                        $total += $produto['preco_venda'];
                    }
                } else {
                    $total += $produto['preco_venda'];
                }
            } else {
                $total += $produto['preco_venda'];
            }
           
            return $total;
        } else {
            return false;
        }
    }
}
