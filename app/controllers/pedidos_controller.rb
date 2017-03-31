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

  # GET /pedidos
  # GET /pedidos.json
  def index
    @pedidos = Pedido.all
  end

  # GET /pedidos/1
  # GET /pedidos/1.json
  def show
  end

  # GET /pedidos/new
  def new
    @pedido = Pedido.new
  end

  # GET /pedidos/1/edit
  def edit
  end

  # POST /pedidos
  # POST /pedidos.json
  def create
    @pedido = Pedido.new(pedido_params)

    respond_to do |format|
      if @pedido.save
        format.html { redirect_to @pedido, notice: 'Pedido was successfully created.' }
        format.json { render :show, status: :created, location: @pedido }
      else
        format.html { render :new }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pedidos/1
  # PATCH/PUT /pedidos/1.json
  def update
    respond_to do |format|
      if @pedido.update(pedido_params)
        format.html { redirect_to @pedido, notice: 'Pedido was successfully updated.' }
        format.json { render :show, status: :ok, location: @pedido }
      else
        format.html { render :edit }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pedidos/1
  # DELETE /pedidos/1.json
  def destroy
    @pedido.destroy
    respond_to do |format|
      format.html { redirect_to pedidos_url, notice: 'Pedido was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pedido
      @pedido = Pedido.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pedido_params
      params.require(:pedido).permit(:user_id, :endereco_id)
    end
end
