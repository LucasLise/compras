class MarcasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_marca, only: [:show, :edit, :update, :destroy]

  # GET /marcas
  # GET /marcas.json
  def index
    @marcas = index_and_respond Marca.all
    authorize @marcas
  end

  # GET /marcas/1
  # GET /marcas/1.json
  def show
    authorize @marca
  end

  # GET /marcas/new
  def new
    @marca = Marca.new
    authorize @marca
  end

  # GET /marcas/1/edit
  def edit
    authorize @marca
  end

  # POST /marcas
  # POST /marcas.json
  def create
    @marca = Marca.new(marca_params)
    save_and_respond @marca, 'Marca criada com sucesso'
    authorize @marca
  end

  # PATCH/PUT /marcas/1
  # PATCH/PUT /marcas/1.json
  def update
    @marca.update(marca_params)
    save_and_respond @marca, 'Marca criada com sucesso'
    authorize @marca
  end

  # DELETE /marcas/1
  # DELETE /marcas/1.json
  def destroy
    destroy_and_respond @marca, marcas_path, 'Marca removida com sucesso.'
    authorize @marca
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_marca
      @marca = Marca.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def marca_params
      params.require(:marca).permit(:descricao)
    end
end
