require "rails_helper"

feature "gerenciando endereços" do
  let!(:user){FactoryGirl.create(:user, role: 1) }
  let!(:produto){FactoryGirl.create(:produto)}
  let!(:imagem){FactoryGirl.create(:imagem, produto: produto)}
  let!(:unidade_federativa){FactoryGirl.create(:unidade_federativa, sigla: 'MG')}
  let!(:municipio){FactoryGirl.create(:municipio, unidade_federativa: unidade_federativa)}

  before :each do
      login_as(user, :scope => :user)
  end

  scenario 'criando endereco' do
    visit galeria_index_path
    click_on 'Adicionar ao Carrinho'
    visit carrinhos_path
    click_on 'Confirmar endereço'
    fill_in 'Logradouro', with: 'Favela'
    fill_in 'Número', with: 123
    fill_in 'Rua', with: 'Argentina'
    fill_in 'Bairro', with: 'Pesado'
    fill_in 'Complemento', with: 'Perigoso'
    select 'Erechim', from: 'municipio_unidade_federativa'
    select 'MG', from: 'endereco_unidade_federativa'
    fill_in 'CEP', with: '1231.123.12'
    click_on 'Confirmar Endereço'
    expect(page).to have_content 'Ótima escolha!'
  end
end
