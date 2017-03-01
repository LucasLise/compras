class GaleriaController < ApplicationController

  def index
    @q = Produto.ransack(params[:q])
    @produtos = @q.result(distinct: true)
    @produtos = @produtos.paginate(page: params[:page], per_page: 40 )

    if params[:ordem] == 'crescente'
      @produtos = @produtos.order(preco: :asc)
    else
      @produtos = @produtos.order(preco: :desc)
    end

    if params[:buscar]
      @categoria = Categoria.find_by(descricao: params[:buscar])
      @produtos = @produtos.where(categoria_id: @categoria.id)
    end
  end
end
