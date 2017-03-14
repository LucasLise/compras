class ImagensController < ApplicationController
  before_action :set_imagem, only: [:show, :edit, :update, :destroy]

  # GET /imagens
  # GET /imagens.json
  def index
    @imagens = Imagem.all
  end

  # GET /imagens/1
  # GET /imagens/1.json
  def show
  end

  # GET /imagens/new
  def new
    @imagem = Imagem.new
  end

  # GET /imagens/1/edit
  def edit
  end

  # POST /imagens
  # POST /imagens.json
  def create
    @imagem = Imagem.new(imagem_params)
    @imagem.produto.id = :produto_id

    respond_to do |format|
      if @imagem.save
        format.html { redirect_to @imagem, notice: 'Imagem was successfully created.' }
        format.json { render :show, status: :created, location: @imagem }
      else
        format.html { render :new }
        format.json { render json: @imagem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /imagens/1
  # PATCH/PUT /imagens/1.json
  def update
    respond_to do |format|
      if @imagem.update(imagem_params)
        format.html { redirect_to @imagem, notice: 'Imagem was successfully updated.' }
        format.json { render :show, status: :ok, location: @imagem }
      else
        format.html { render :edit }
        format.json { render json: @imagem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /imagens/1
  # DELETE /imagens/1.json
  def destroy
    @imagem.destroy
    respond_to do |format|
      format.html { redirect_to imagens_url, notice: 'Imagem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_imagem
      @imagem = Imagem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def imagem_params
      params.require(:imagem).permit(:produto_id, :imagem)
    end
end
