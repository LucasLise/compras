require "rails_helper"

feature "filtrando produtos" do
  let!(:marca){FactoryGirl.create(:marca)}

  let!(:user){FactoryGirl.create(:user) }
  let!(:produto){FactoryGirl.create(:produto)}

  before :each do
      login_as(user, :scope => :user)
  end

  scenario "deve retornar somente produtos da categoria"  do
    visit('/galeria')
    screenshot_and_save_page
    expect(page).to have_content('Eletrônicos')
  end

  scenario "deve retornar somente produtos da marca" do
    visit('/galeria')
    expect(page).to have_content('HP')
  end
end
