require 'rails_helper'

feature 'gerenciando comentarios' do
  let!(:user){FactoryGirl.create(:user) }
  let!(:produto){FactoryGirl.create(:produto)}
  let!(:imagem){FactoryGirl.create(:imagem, produto: produto)}

  before :each do
    login_as(user, :scope => :user)
  end

  scenario 'adicionando comentario' do
    visit produto_path(produto)
    click_on 'Avaliar Produto'
    expect(page).to have_content('Sua Avaliação')
    fill_in 'comentario_descricao', with: 'testando comentario'
    click_on 'Enviar'
    expect(page).to have_content(user.nome)
    expect(page).to have_content('testando comentario')
  end
end
