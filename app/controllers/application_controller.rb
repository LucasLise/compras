class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  include Pundit
  protect_from_forgery

  protect_from_forgery with: :exception
  helper_method :produtos_carrinho, :carrinho_atual, :valor_item, :valor_total

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

  def valor_total
    total = 0
    carrinho_atual.itens_carrinho.each do |item_carrinho|
      total += item_carrinho.produto.preco * item_carrinho.quantidade
    end
    total
  end

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "Você não possui permição para esta ação."
    redirect_to(request.referrer || root_path)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nome])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:cpf])
  end
end
