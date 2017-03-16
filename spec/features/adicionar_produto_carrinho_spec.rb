require "rails_helper"

feature "adicionar produto ao carrinho" do
  let!(:user){FactoryGirl.create(:user) }
  let!(:produto){FactoryGirl.create(:produto)}
  let!(:imagem){FactoryGirl.create(:imagem, produto: produto)}


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

  scenario 'deve incrementar item no carrinho' do
    adicionar_ao_carrinho
    expect(find(:css, '.quantidade').value ).to eq('1')
    adicionar_ao_carrinho
    expect(find(:css, '.quantidade').value ).to eq('2')
    adicionar_ao_carrinho
    expect(find(:css, '.quantidade').value ).to eq('3')
  end

  def adicionar_ao_carrinho
    visit('/')
    click_link('Adicionar ao Carrinho')
    visit carrinhos_path
    expect(page).to have_content('Notebook')
    screenshot_and_save_page
    expect(page).to have_css('.quantidade')
  end

end
