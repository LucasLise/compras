require 'rails_helper'

feature 'gerenciando categorias' do

  let!(:categoria){FactoryGirl.create(:categoria, descricao: 'categoria')}
  let!(:user){FactoryGirl.create(:user, role: 1) }

  before :each do
      login_as(user, :scope => :user)
  end

  scenario 'listar categorias' do
    visit categorias_path
    expect(page).to have_content(categoria.descricao)
  end

  scenario 'criando categoria' do
      visit new_categoria_path
      fill_in 'Descrição', with: 'TESTE'
      click_on 'Salvar'
      expect(page).to have_content('Categoria criada com sucesso.')
  end

  scenario 'atualizando categoria' do
      visit edit_categoria_path(categoria)
      fill_in 'Descrição', with: 'TESTEs'
      click_on 'Salvar'
      expect(page).to have_content('Categoria atualizada com sucesso.')
  end

  scenario 'excluindo categoria' do
      visit categorias_path
      click_on 'Excluir'
      expect(page).to have_content('Categoria removida com sucesso.')
  end

  scenario 'vizualizar categoria' do
    visit categoria_path(categoria)
    expect(page).to have_content(categoria.descricao)
  end
end
