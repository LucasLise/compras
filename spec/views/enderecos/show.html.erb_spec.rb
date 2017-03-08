require 'rails_helper'

RSpec.describe "enderecos/show", type: :view do
  before(:each) do
    @endereco = assign(:endereco, Endereco.create!(
      :logradouro => "Logradouro",
      :numero => 2,
      :complemento => "Complemento",
      :bairro => "Bairro",
      :cep => "Cep",
      :cidade => "Cidade",
      :uf => "Uf"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Logradouro/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Complemento/)
    expect(rendered).to match(/Bairro/)
    expect(rendered).to match(/Cep/)
    expect(rendered).to match(/Cidade/)
    expect(rendered).to match(/Uf/)
  end
end
