class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery

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

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    #flash[:notice] = "Você não tem permição para esta ação"
    redirect_to(request.referrer || root_path)
  end

end
