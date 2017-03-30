require "rails_helper"

feature "permissões" do
  let!(:user){FactoryGirl.create(:user) }
  let!(:produto){FactoryGirl.create(:produto)}
  let!(:imagem){FactoryGirl.create(:imagem, produto: produto)}

  scenario 'nao deve ter permissão para acessar' do
    login_as(user, :scope => :user)

    visit categorias_path

    expect(page).to have_content 'Você não possui permissão para esta ação.'
  end

  scenario 'deve estar autenticado' do
    visit galeria_index_path

    click_on 'Adicionar ao Carrinho'

    expect(page).to have_content  'Para continuar, faça login ou registre-se.'
  end
end
