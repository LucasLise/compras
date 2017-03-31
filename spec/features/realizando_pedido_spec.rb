require "rails_helper"

feature "realizando pedido" do
  let!(:user1){FactoryGirl.create(:user) }
  let!(:user2){FactoryGirl.create(:user, email: 'admin@admin.com', cpf: '123.123.123-23', role: 1) }
  let!(:produto){FactoryGirl.create(:produto)}
  let!(:carrinho){FactoryGirl.create(:carrinho, user: user1)}
  let!(:item_carrinho){FactoryGirl.create(:item_carrinho, produto: produto, carrinho: carrinho)}
  let!(:unidade_federativa){FactoryGirl.create(:unidade_federativa, sigla: 'MG')}
  let!(:municipio){FactoryGirl.create(:municipio, unidade_federativa: unidade_federativa)}
  let!(:endereco){FactoryGirl.create(:endereco, user: user1, unidade_federativa: unidade_federativa, municipio: municipio)}
  let!(:imagem){FactoryGirl.create(:imagem, produto: produto)}

  scenario "deve exibir pagina para escolher endereços" do
    login_as(user1, :scope => :user)
    visit('/galeria')
    click_link('Adicionar ao Carrinho')
    click_link('Carrinho (1)')

    click_link('Confirmar endereço')
    expect(page).to have_content('Pedido')
    expect(page).to have_content('Endereço')
  end

  scenario 'comprando' do
    login_as(user1, :scope => :user)
    visit carrinhos_path
    expect(page).to have_content('Notebook')
    click_on('Confirmar endereço')
  end

  scenario 'escolhendo endereço' do
    login_as(user1, :scope => :user)
    pedido
    expect(page).to have_content('Endereco de entrega:')
  end

  scenario 'mostrar todos pedidos para administrador' do
    pedido
    login_as(user2, :scope => :user)
    visit todos_pedidos_pedidos_path
    expect(page).to have_content("Pedido #{Pedido.last.id}")
    expect(page).to have_content(produto.descricao)
  end

  scenario 'ordenar por mais recentes' do
    pedido
    pedido
    visit todos_pedidos_pedidos_path
    select 'Menos recentes', from: 'recentes'

    within first('.numero-pedido') do
      expect(page).to have_content("Pedido #{Pedido.first.id}")
    end
  end

  private

  def pedido
    login_as(user1, :scope => :user)
    visit new_endereco_path
    expect(page).to have_content('Endereço')
    expect(page).to have_content('Pedido')
    expect(page).to have_content('Escolher Endereço')
    click_on ('Escolher Endereço')
    expect(page).to have_content('Ótima escolha!')
    click_on('Finalizar Compra')
  end
end
