require "rails_helper"

feature "realizando pedido" do
  let!(:user){FactoryGirl.create(:user) }
  let!(:produto){FactoryGirl.create(:produto)}

  before :each do
      login_as(user, :scope => :user)
  end

  scenario "deve exibir pagina para escolher endereços" do
    visit('/galeria')
    click_link('Adicionar ao Carrinho')
    click_link('Carrinho (1)')

    click_link('Confirmar endereço')
    expect(page).to have_content('Pedido')
    expect(page).to have_content('Endereço')
  end
end
