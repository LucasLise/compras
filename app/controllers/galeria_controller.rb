class GaleriaController < ApplicationController

  def index
    @produtos = Produto.all
    @produtos = @produtos.paginate(page: params[:page], per_page: 40 )
  end

end
