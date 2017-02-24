class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :produtos_carrinho, :carrinho_atual, :todas_categorias

  def produtos_carrinho
    Produto.all
  end

  def carrinho_atual
    if current_user
      if Carrinho.exists?(current_user.id)
        Carrinho.find(current_user.id)
      else
        carrinho = Carrinho.new
        carrinho.user_id = current_user.id
        carrinho.save
        Carrinho.last
      end
    end
  end

  def todas_categorias
    Categoria.all
  end
end
