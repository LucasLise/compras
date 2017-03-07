require "rails_helper"

feature "realizando pedido" do
  let!(:user){FactoryGirl.create(:user) }
  let!(:produto){FactoryGirl.create(:produto)}

  before :each do
      login_as(user, :scope => :user)
  end

  scenario "deve concluir pedido e redirecionar para os pedidos" do
    visit('/galeria')
    click_link('Adicionar ao Carrinho')
    click_link('Carrinho (1)')
    expect(page).to have_content('Efetuar Pedido')
    click_link('Efetuar Pedido')
    expect(page).to have_content('Pedido 1')
    expect(page).to have_content('Notebook')
  end
end
