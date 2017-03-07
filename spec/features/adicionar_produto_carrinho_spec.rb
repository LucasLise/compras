require "rails_helper"

feature "adicionar produto ao carrinho" do
  let!(:user){FactoryGirl.create(:user) }
  let!(:produto){FactoryGirl.create(:produto)}

  before :each do
      login_as(user, :scope => :user)
  end

  scenario "deve adicionar produto ao carrinho" do
    visit('/galeria')
    click_link('Adicionar ao Carrinho')
    click_link('Carrinho (1)')
    expect(page).to have_content('Total: R$ 1.232,00')
    click_link('Logout')
  end
end
