class CategoriasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_categoria, only: [:show, :edit, :update, :destroy]

  # GET /categorias
  # GET /categorias.json
  def index
    @categorias = policy_scope(Categoria).all
    authorize @categorias
    @categorias = index_and_respond @categorias
  end

  # GET /categorias/1
  # GET /categorias/1.json
  def show
    authorize @categoria
  end

  # GET /categorias/new
  def new
    @categoria = policy_scope(Categoria).new
    authorize @categoria
  end

  # GET /categorias/1/edit
  def edit
    authorize @categoria
  end

  # POST /categorias
  # POST /categorias.json
  def create
    @categoria = policy_scope(Categoria).new(categoria_params)
    authorize @categoria
    save_and_respond @categoria, 'Categoria criada com sucesso.'
  end

  # PATCH/PUT /categorias/1
  # PATCH/PUT /categorias/1.json
  def update
    authorize @categoria
    @categoria.update(categoria_params)
    save_and_respond @categoria, 'Categoria atualizada com sucesso.'
  end

  # DELETE /categorias/1
  # DELETE /categorias/1.json
  def destroy
    destroy_and_respond(@categoria, categorias_path, 'Categoria removida com sucesso.')
    authorize @categoria
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_categoria
      @categoria = policy_scope(Categoria).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def categoria_params
      params.require(:categoria).permit(:descricao)
    end
end
