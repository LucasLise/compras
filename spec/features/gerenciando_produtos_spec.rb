require "rails_helper"

feature "permissões" do
  let!(:user){FactoryGirl.create(:user, role: 1) }
  let!(:produto){FactoryGirl.create(:produto)}
  let!(:imagem){FactoryGirl.create(:imagem, produto: produto)}
  let!(:categoria){ FactoryGirl.create(:categoria, descricao: 'Alimentos')}
  let!(:marca){ FactoryGirl.create(:marca, descricao: 'HP')}

  before :each do
      login_as(user, :scope => :user)
  end

  scenario 'criando produto' do
    # visit new_produto_path
    # fill_in 'Descrição', with: 'celular'
    # fill_in 'Preço', with: 123.00
    # fill_in 'Quantidade', with: 12
    # # select 'Alimentos', from: 'select2-produto_categoria_id-container'
    # select(marca.descricao, from:'select2-produto_marca_id-container')
  end

  scenario 'atualizar produto' do
    visit edit_produto_path(produto)
    fill_in 'Descrição', with: 'editando descricao'

    click_on 'Atualizar Produto'
    expect(page).to have_content('Produto was successfully updated.')
  end

  scenario 'remover produto' do
    visit produtos_path
    imagem.destroy

    click_on 'Destroy'
    expect(page).to have_content('Produto was successfully updated.')
  end
end
