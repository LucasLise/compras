require 'rails_helper'

feature 'vizualizando produto' do
  let!(:user){FactoryGirl.create(:user)}
  let!(:produto){FactoryGirl.create(:produto)}
  let!(:comentario){FactoryGirl.create(:comentario, user: user, produto: produto)}

  before :each do
    login_as(user, :scope => :user)
  end

  scenario 'deve mostrar show de produto' do
    visit('/')
    click_link('Notebook')
    expect(page).to have_content('Notebook')
  end

  scenario 'deve adicionar comentario' do
      visit (produto_path(Produto.last.id))
      fill_in "comentario_descricao", with: 'teste'
      click_on ('Enviar')
      expect(page).to have_content('Nome')
      expect(page).to have_content('teste')
  end

  scenario 'deve excluir comentario' do
    visit (produto_path(Produto.last.id))
    expect(page).to have_content('testando comentario')
    click_on ('Excluir')
    expect(page).to have_no_content('testando comentario')
  end

  scenario 'deve voltar para galeria' do
    visit(produto_path(Produto.last.id))
    expect(page).to have_content('Voltar à loja')
    click_on('Voltar à loja')
    expect(page).to have_content('Categorias')
  end
end
