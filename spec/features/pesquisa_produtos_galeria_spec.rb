require "rails_helper"

feature "pesquisando produtos na galeria" do

  let!(:produto) { FactoryGirl.create(:produto, descricao: "Notebook") }
  let!(:imagem){FactoryGirl.create(:imagem, produto: produto)}

  scenario "ao pesquisar pela descrição deve exibir os produtos correspondentes" do
    visit "/galeria"

    fill_in "q_descricao_cont", with: "Notebook"

    click_button "Pesquisar"

    screenshot_and_save_page
    within ".descricao-produto" do
      expect(page).to have_content("Notebook")
    end
  end

end
