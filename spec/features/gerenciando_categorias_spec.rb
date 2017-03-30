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
    expect(page).to have_content(categoria.id)
  end

  scenario 'criando categoria' do
      visit new_categoria_path
      fill_in 'Descrição', with: 'TESTE'
      click_on 'Criar Categoria'
      expect(page).to have_content('Categoria was successfully created.')
  end

  scenario 'atualizando categoria' do
      visit edit_categoria_path(categoria)
      fill_in 'Descrição', with: 'TESTEs'
      click_on 'Atualizar Categoria'
      expect(page).to have_content('Categoria was successfully updated.')
  end

  scenario 'excluindo categoria' do
      visit categorias_path
      click_on 'Destroy'
      expect(page).to have_content('Categoria was successfully destroyed.')
  end

  scenario 'vizualizar categoria' do
    visit categoria_path(categoria)
    expect(page).to have_content(categoria.descricao)
  end
end
