class PedidoService
  attr_reader :carrinho_atual

  def initialize(carrinho_atual, endereco, usuario)
    @carrinho_atual = carrinho_atual
    @endereco = endereco
    @usuario = usuario
  end

  def criar_pedido
    @pedido = Pedido.create(user: @usuario, valor_total: valor_total_pedido, endereco_id: @endereco)
    migrar_itens_carrinho_para_pedidos
    atualizar_produto_estoque
  end

  private

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

  def migrar_itens_carrinho_para_pedidos
    carrinho_atual.itens_carrinho.each do |item_carrinho|
      item_pedido = @pedido.itens_pedido.new(produto: item_carrinho.produto, quantidade: item_carrinho.quantidade)
      item_pedido.calcula_valores
      item_pedido.save
    end
  end

  def valor_total_pedido
    total = 0
    carrinho_atual.itens_carrinho.each do |item_carrinho|
      total += item_carrinho.produto.preco * item_carrinho.quantidade
    end
    total
  end

end
