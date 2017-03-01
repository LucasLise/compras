class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :produtos_carrinho, :carrinho_atual, :todas_categorias, :valor_item, :valor_total


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

  def valor_item(valor_unitario, preco)
     valor_unitario * preco
  end

  def valor_total
    total = 0
    carrinho_atual.itens_carrinho.each do |item_carrinho|
      total += item_carrinho.produto.preco * item_carrinho.quantidade
    end
    total
  end
end
