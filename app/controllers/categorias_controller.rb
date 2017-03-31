class CategoriasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_categoria, only: [:show, :edit, :update, :destroy]

  # GET /categorias
  # GET /categorias.json
  def index
    @categorias = policy_scope(Categoria).all
    authorize @categorias
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

    respond_to do |format|
      if @categoria.save
        format.html { redirect_to @categoria, notice: 'Categoria was successfully created.' }
        format.json { render :show, status: :created, location: @categoria }
      else
        format.html { render :new }
        format.json { render json: @categoria.errors, status: :unprocessable_entity }
      end
    end
    authorize @categoria
  end

  # PATCH/PUT /categorias/1
  # PATCH/PUT /categorias/1.json
  def update
    respond_to do |format|
      if @categoria.update(categoria_params)
        format.html { redirect_to @categoria, notice: 'Categoria was successfully updated.' }
        format.json { render :show, status: :ok, location: @categoria }
      else
        format.html { render :edit }
        format.json { render json: @categoria.errors, status: :unprocessable_entity }
      end
    end
    authorize @categoria
  end

  # DELETE /categorias/1
  # DELETE /categorias/1.json
  def destroy
    @categoria.destroy
    respond_to do |format|
      format.html { redirect_to categorias_url, notice: 'Categoria was successfully destroyed.' }
      format.json { head :no_content }
    end
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
