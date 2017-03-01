class CarrinhosController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:quantidade_atual]
      params[:id_item]
      carrinho_atual.itens_carrinho.update(3, quantidade: params[:quantidade_atual])
      carrinho_atual
    end
  end

  def adiciona_produto_carrinho
    produto = Produto.find(params[:produto_id])
    if carrinho_atual.itens_carrinho.exists?(produto: produto)
      item_atual = carrinho_atual.itens_carrinho.find_by(produto: produto)
      item_atual.increment!(:quantidade, 1)
    else
      carrinho_atual.itens_carrinho.create(produto: produto, quantidade: 1)
      redirect_to galeria_index_path
    end
  end

end
