class GaleriaController < ApplicationController
    helper_method :todas_categorias, :todas_marcas

    def index
        @q = Produto.ransack(params[:q])
        @produtos = @q.result(distinct: true)
        @produtos = @produtos.paginate(page: params[:page], per_page: 9)

        @produtos = if params[:ordem] == 'crescente'
                        @produtos.order(preco: :asc)
                    else
                        @produtos.order(preco: :desc)
                    end

        if params[:buscar_categoria]
            @categoria = Categoria.find(params[:buscar_categoria])
            @produtos = @produtos.where(categoria_id: @categoria.id)
        end

        if params[:buscar_marca]
            @marca = Marca.find(params[:buscar_marca])
            @produtos = @produtos.where(marca_id: @marca.id)
        end
    end

    def todas_categorias
        Categoria.all
    end

    def todas_marcas
        Marca.all
    end
end
