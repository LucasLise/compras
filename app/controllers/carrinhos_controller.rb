class CarrinhosController < ApplicationController

  def index
    @produtos = Produto.where(id: session[:lista_produtos])
    #@produtos = Produto.where(id: 12)
    #@produtos = Produto.all
  end

  def adiciona_produto_carrinho
     if !session[:lista_produtos]
        session[:lista_produtos] = []
     end
     session[:lista_produtos] << params[:produto_id]
     redirect_to galeria_index_path
  end

end
