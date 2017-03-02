class ItensPedidoController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item_pedido, only: [:show, :edit, :update, :destroy]

  # GET /itens_pedido
  # GET /itens_pedido.json
  def index
    @itens_pedido = ItemPedido.all
  end

  # GET /itens_pedido/1
  # GET /itens_pedido/1.json
  def show
  end

  # GET /itens_pedido/new
  def new
    @item_pedido = ItemPedido.new
  end

  # GET /itens_pedido/1/edit
  def edit
  end

  # POST /itens_pedido
  # POST /itens_pedido.json
  def create
    @item_pedido = ItemPedido.new(item_pedido_params)

    respond_to do |format|
      if @item_pedido.save
        format.html { redirect_to @item_pedido, notice: 'Item pedido was successfully created.' }
        format.json { render :show, status: :created, location: @item_pedido }
      else
        format.html { render :new }
        format.json { render json: @item_pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /itens_pedido/1
  # PATCH/PUT /itens_pedido/1.json
  def update
    respond_to do |format|
      if @item_pedido.update(item_pedido_params)
        format.html { redirect_to @item_pedido, notice: 'Item pedido was successfully updated.' }
        format.json { render :show, status: :ok, location: @item_pedido }
      else
        format.html { render :edit }
        format.json { render json: @item_pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /itens_pedido/1
  # DELETE /itens_pedido/1.json
  def destroy
    @item_pedido.destroy
    respond_to do |format|
      format.html { redirect_to itens_pedido_url, notice: 'Item pedido was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_pedido
      @item_pedido = ItemPedido.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_pedido_params
      params.require(:item_pedido).permit(:pedido_id, :produto_id, :quantidade)
    end
end
