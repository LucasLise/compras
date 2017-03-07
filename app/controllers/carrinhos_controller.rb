class CarrinhosController < ApplicationController
  before_action :authenticate_user!
  helper_method :valor_total, :produtos_carrinho

  def index
    if params[:quantidade_atual] && params[:id_item]
      carrinho_atual.itens_carrinho.update(params[:id_item], quantidade: params[:quantidade_atual])
      carrinho_atual
    end
  end

  def adiciona_produto_carrinho
    produto = Produto.find(params[:produto_id])
    if carrinho_atual.itens_carrinho.exists?(produto: produto)
      item_atual = carrinho_atual.itens_carrinho.find_by(produto: produto)
      item_atual.increment!(:quantidade, 1)
      redirect_to galeria_index_path
    else
      carrinho_atual.itens_carrinho.create(produto: produto, quantidade: 1)
      redirect_to galeria_index_path
    end
  end

  def valor_total
    total = 0
    carrinho_atual.itens_carrinho.each do |item_carrinho|
      total += item_carrinho.produto.preco * item_carrinho.quantidade
    end
    total
  end

  def produtos_carrinho
    Produto.all
  end

end
