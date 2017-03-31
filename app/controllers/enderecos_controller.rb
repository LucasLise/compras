class EnderecosController < ApplicationController
  before_action :authenticate_user!
  def new
    @endereco = Endereco.new
  end

  def create
    @endereco = Endereco.new(endereco_params)
    @endereco.user_id = current_user.id
    respond_to do |format|
      if @endereco.save
        format.html {redirect_to finalizar_pedido_pedidos_path(endereco: @endereco)}
      else
        format.html { render :new }
        format.json { render json: @endereco.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def endereco_params
    params.require(:endereco).permit(:logradouro, :numero, :complemento, :bairro, :cep, :user_id, :municipio_id, :unidade_federativa_id, :rua)
  end
end
