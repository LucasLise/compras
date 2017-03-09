class PedidosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pedido, only: [:show, :edit, :update, :destroy]
  helper_method :valor_total_pedido


  def finalizar_pedido
    @endereco = params[:endereco]
  end

  def todos_pedidos
    if params[:ordem]
      if params[:ordem] == 'recentes'
          @pedidos = Pedido.all.reverse
      else
        @pedidos = Pedido.all
      end
    else
      @pedidos = Pedido.all.reverse
    end
  end

  def criar_pedido
    pedido = Pedido.create(user: current_user, valor_total: valor_total_pedido, endereco_id: params[:endereco])
    carrinho_atual.itens_carrinho.each do |item_carrinho|
      item_pedido = pedido.itens_pedido.new(produto: item_carrinho.produto, quantidade: item_carrinho.quantidade)
      item_pedido.calcula_valores
      item_pedido.save
    end
    atualizar_produto_estoque
    carrinho_atual.itens_carrinho.destroy_all
    carrinho_atual.destroy
    redirect_to pedidos_path
  end

  def valor_total_pedido
    total = 0
    carrinho_atual.itens_carrinho.each do |item_carrinho|
      total += item_carrinho.produto.preco * item_carrinho.quantidade
    end
    total
  end

  def atualizar_produto_estoque
    carrinho_atual.itens_carrinho.each do |item_carrinho|
      quantidade_produto = item_carrinho.produto.quantidade
      quantidade_carrinho = item_carrinho.quantidade
      item_carrinho.produto.update(quantidade: quantidade_produto - quantidade_carrinho)
    end
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
