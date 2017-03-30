require 'rails_helper'

feature 'ordenando produtos' do

  let!(:produto1){FactoryGirl.create(:produto, preco: 100)}
  let!(:imagem1){FactoryGirl.create(:imagem, produto: produto1)}
  let!(:produto2){FactoryGirl.create(:produto, preco: 200)}
  let!(:imagem2){FactoryGirl.create(:imagem, produto: produto2)}

  scenario 'deve ordenar por ordem crescente' do
    visit galeria_index_path
    page.select 'Menor Preço', from: 'ordenacao'
    within first('.preco-produto') do
      expect(page).to have_content('R$ 100,00')
    end
  end

  scenario 'deve ordenar por ordem decrescente' do
    visit galeria_index_path
    page.select 'Maior Preço', :from => 'ordenacao'
    within first('.preco-produto') do
      expect(page).to have_content('R$ 200,00')
    end
  end
end
