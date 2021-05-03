<?php
class TCS_View_Helpers_Total {
    public function Total($params) {
        if (is_array($params) && count($params) > 0) {
            $total = 0;
            foreach ($params as $key => $produto) {
                if ($produto['desconto'] > 0.00) {
                    //se a data atual estiver entre a data_inicial e a data final de promo��o se a data estiver cadastrada
                    if ($produto['data_inicio_promocao'] != '0000-00-00' && $produto['data_fim_promocao'] != '0000-00-00') {
                        if (date("Y-m-d") >= $produto['data_inicio_promocao'] && date("Y-m-d") <= $produto['data_fim_promocao']) {
                           $desconto = ($produto['preco_venda'] - $produto['desconto']);
                           $total += ($desconto * $produto['quantidade']);
                        } else {
                            $total += ($produto['preco_venda'] * $produto['quantidade']);
                        }
                    } else {
                        $total += ($produto['preco_venda'] * $produto['quantidade']);
                    }
                } else {
                    $total += ($produto['preco_venda'] * $produto['quantidade']);
                }
            }
            return $total;
        } else {
            return false;
        }
    }
}
