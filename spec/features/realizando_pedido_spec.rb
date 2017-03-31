require "rails_helper"

feature "realizando pedido" do
  let!(:user){FactoryGirl.create(:user) }
  let!(:produto){FactoryGirl.create(:produto)}
  let!(:carrinho){FactoryGirl.create(:carrinho, user: user)}
  let!(:item_carrinho){FactoryGirl.create(:item_carrinho, produto: produto, carrinho: carrinho)}
  let!(:unidade_federativa){FactoryGirl.create(:unidade_federativa, sigla: 'MG')}
  let!(:municipio){FactoryGirl.create(:municipio, unidade_federativa: unidade_federativa)}
  let!(:endereco){FactoryGirl.create(:endereco, user: user, unidade_federativa: unidade_federativa, municipio: municipio)}
  let!(:imagem){FactoryGirl.create(:imagem, produto: produto)}

  before :each do
      login_as(user, :scope => :user)
  end

  scenario "deve exibir pagina para escolher endereços" do
    visit('/galeria')
    click_link('Adicionar ao Carrinho')
    click_link('Carrinho (1)')

    click_link('Confirmar endereço')
    expect(page).to have_content('Pedido')
    expect(page).to have_content('Endereço')
  end

  scenario 'comprando' do
    visit carrinhos_path
    expect(page).to have_content('Notebook')
    click_on('Confirmar endereço')
  end

  scenario 'escolhendo endereço' do
    visit new_endereco_path
    expect(page).to have_content('Endereço')
    expect(page).to have_content('Pedido')
    expect(page).to have_content('Escolher Endereço')
    click_on ('Escolher Endereço')
    expect(page).to have_content('Ótima escolha!')
    click_on('Finalizar Compra')
    expect(page).to have_content('Endereco de entrega:')
  end

end
