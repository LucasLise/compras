require "rails_helper"

feature "efetuar login" do

  scenario "cadastrar-se no site" do
    visit new_user_registration_path
    fill_in 'Email', with: 'teste@teste.com'
    fill_in 'Senha', with: '123123'
    fill_in 'Confirme sua senha', with: '123123'
    click_button('Inscrever-se')

    screenshot_and_save_page
    expect(page).to have_content('Log out') 
  end

end
