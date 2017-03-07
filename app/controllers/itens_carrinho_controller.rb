class ItensCarrinhoController < ApplicationController
  before_action :authenticate_user!

  def destroy
    @item_carrinho = ItemCarrinho.find(params[:id])
    @item_carrinho.destroy
    redirect_to carrinhos_path
  end
end
