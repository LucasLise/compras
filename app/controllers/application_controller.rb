class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :produtos_carrinho, :carrinho_atual, :valor_item

  def carrinho_atual
    if current_user
      if Carrinho.exists?(user_id: current_user.id)
        Carrinho.find_by(user_id: current_user.id)
      else
        Carrinho.create(user_id: current_user.id)
        Carrinho.last
      end
    end
  end

  def valor_item(valor_unitario, preco)
     valor_unitario * preco
  end

end
