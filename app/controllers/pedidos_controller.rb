class PedidosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pedido, only: [:show, :edit, :update, :destroy]
  helper_method :valor_total_pedido

  def finalizar_pedido
    @endereco = params[:endereco]
  end

  def todos_pedidos
    @pedidos = if params[:ordem]
      if params[:ordem] == 'recentes'
        Pedido.all.reverse
      else
        Pedido.all
      end
    else
      Pedido.all.reverse
    end
  end

  def criar_pedido
    pedido_service = PedidoService.new(carrinho_atual, params[:endereco], current_user).criar_pedido
    carrinho_atual.itens_carrinho.destroy_all
    carrinho_atual.destroy
    redirect_to pedidos_path
  end

  def show
  end

end
