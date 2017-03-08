require 'rails_helper'

RSpec.describe "enderecos/index", type: :view do
  before(:each) do
    assign(:enderecos, [
      Endereco.create!(
        :logradouro => "Logradouro",
        :numero => 2,
        :complemento => "Complemento",
        :bairro => "Bairro",
        :cep => "Cep",
        :cidade => "Cidade",
        :uf => "Uf"
      ),
      Endereco.create!(
        :logradouro => "Logradouro",
        :numero => 2,
        :complemento => "Complemento",
        :bairro => "Bairro",
        :cep => "Cep",
        :cidade => "Cidade",
        :uf => "Uf"
      )
    ])
  end

  it "renders a list of enderecos" do
    render
    assert_select "tr>td", :text => "Logradouro".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Complemento".to_s, :count => 2
    assert_select "tr>td", :text => "Bairro".to_s, :count => 2
    assert_select "tr>td", :text => "Cep".to_s, :count => 2
    assert_select "tr>td", :text => "Cidade".to_s, :count => 2
    assert_select "tr>td", :text => "Uf".to_s, :count => 2
  end
end
