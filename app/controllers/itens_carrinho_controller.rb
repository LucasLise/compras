class ItensCarrinhoController < ApplicationController
  def destroy
    @item_carrinho = ItemCarrinho.find(params[:id])
    @item_carrinho.destroy
    redirect_to carrinhos_path
    #format.js
  end
end
