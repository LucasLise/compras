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
      if item_atual.increment!(:quantidade, 1)
        respond_to do |format|
          format.html {redirect_to galeria_index_path, alert: 'Produto já está em seu Carrinho'}
        end
      end
    else
      if carrinho_atual.itens_carrinho.create(produto: produto, quantidade: 1)
        respond_to do |format|
          format.html {redirect_to galeria_index_path, notice: 'Produto Adicionado ao Carrinho'}
        end
      end
    end
  end

  def produtos_carrinho
    Produto.all
  end

end
