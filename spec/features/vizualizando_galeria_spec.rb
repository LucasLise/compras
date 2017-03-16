require "rails_helper"

feature "vizualizando galeria" do

  let!(:produto) { FactoryGirl.create(:produto, descricao: "Notebook", preco: 1231) }
  let!(:categoria){ FactoryGirl.create(:categoria, descricao: 'Eletrônicos')}
  let!(:categoria){ FactoryGirl.create(:categoria, descricao: 'Alimentos')}
  let!(:marca){ FactoryGirl.create(:marca, descricao: 'HP')}
  let!(:imagem){FactoryGirl.create(:imagem, produto: produto)}

  scenario "vizualizar produtos da galeria" do
    visit "/galeria"
    expect(page).to have_content("Notebook")
    expect(page).to have_content("R$ 1.231,00")
  end

  scenario "vizualizar categorias" do
    visit "/galeria"
    expect(page).to have_content("Eletrônicos")
    expect(page).to have_content("Alimentos")
  end

  scenario "vizualizar marcas" do
    visit "/galeria"
    expect(page).to have_content("HP")
  end

end
