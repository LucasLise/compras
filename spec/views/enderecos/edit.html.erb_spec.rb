require 'rails_helper'

RSpec.describe "enderecos/edit", type: :view do
  before(:each) do
    @endereco = assign(:endereco, Endereco.create!(
      :logradouro => "MyString",
      :numero => 1,
      :complemento => "MyString",
      :bairro => "MyString",
      :cep => "MyString",
      :cidade => "MyString",
      :uf => "MyString"
    ))
  end

  it "renders the edit endereco form" do
    render

    assert_select "form[action=?][method=?]", endereco_path(@endereco), "post" do

      assert_select "input#endereco_logradouro[name=?]", "endereco[logradouro]"

      assert_select "input#endereco_numero[name=?]", "endereco[numero]"

      assert_select "input#endereco_complemento[name=?]", "endereco[complemento]"

      assert_select "input#endereco_bairro[name=?]", "endereco[bairro]"

      assert_select "input#endereco_cep[name=?]", "endereco[cep]"

      assert_select "input#endereco_cidade[name=?]", "endereco[cidade]"

      assert_select "input#endereco_uf[name=?]", "endereco[uf]"
    end
  end
end
