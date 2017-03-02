class ItensCarrinhoController < ApplicationController
  def destroy
    @item_carrinho = ItemCarrinho.find(params[:id])
    @item_carrinho.destroy
    respond_to do |format|
      format.js { render action: 'destroy' }
    end
  end
end
