class ProdutosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_produto, only: [:show, :edit, :update, :destroy]

  # GET /produtos
  # GET /produtos.json
  def index
    @produtos = index_and_respond Produto.all
    authorize @produtos
  end

  # GET /produtos/1
  # GET /produtos/1.json
  def show
  end

  # GET /produtos/new
  def new
    @produto = Produto.new
    authorize @produto
  end

  # GET /produtos/1/edit
  def edit
    authorize @produto
  end

  # POST /produtos
  # POST /produtos.json
  def create
    @produto = Produto.new(produto_params)
    save_and_respond @produto, 'Produto criado com sucesso.'
    authorize @produto
  end

  # PATCH/PUT /produtos/1
  # PATCH/PUT /produtos/1.json
  def update
    @produto.update(produto_params)
    save_and_respond @produto, 'Produto atualizado com sucesso.'
    authorize @produto
  end

  # DELETE /produtos/1
  # DELETE /produtos/1.json
  def destroy
    delete_imagens_produto
    destroy_and_respond @produto, produtos_path, 'Produto removido com sucesso.'
    authorize @produto
  end

  private
    def delete_imagens_produto
      @produto.imagens.each do |imagem|
        imagem.destroy
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_produto
      @produto = Produto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def produto_params
      params.require(:produto).permit(:descricao, :preco, :quantidade, :categoria_id, :marca_id, imagens_attributes: [:imagem])
    end
end
