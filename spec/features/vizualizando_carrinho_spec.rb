require "rails_helper"

feature 'vizualizando carrinho' do

  let!(:user){FactoryGirl.create(:user)}
  let!(:produto){FactoryGirl.create(:produto)}
  let!(:carrinho){FactoryGirl.create(:carrinho, user: user)}
  let!(:item_carrinho){FactoryGirl.create(:item_carrinho, carrinho: carrinho, produto: produto)}
  let!(:imagem){FactoryGirl.create(:imagem, produto: produto)}

  before :each do
      login_as(user, :scope => :user)
  end

  scenario 'deve conter um item no carrinho' do
    visit carrinhos_path
    expect(page).to have_content('Notebook')
    expect(page).to have_content('Confirmar endereço')
    expect(page).to have_content('R$  1.232,00')
    expect(find(:css, '.quantidade').value).to eq('10')
  end

  scenario 'deve excluir item do carrinho' do
    visit carrinhos_path
    expect(page).to have_css('.glyphicon-trash')
    first('.glyphicon-trash').click
    expect(page).to have_no_css('.glyphicon-trash')
  end

end
