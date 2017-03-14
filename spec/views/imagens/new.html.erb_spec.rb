require 'rails_helper'

RSpec.describe "imagens/new", type: :view do
  before(:each) do
    assign(:imagem, Imagem.new(
      :produto => nil
    ))
  end

  it "renders new imagem form" do
    render

    assert_select "form[action=?][method=?]", imagens_path, "post" do

      assert_select "input#imagem_produto_id[name=?]", "imagem[produto_id]"
    end
  end
end
