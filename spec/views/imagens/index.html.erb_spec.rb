require 'rails_helper'

RSpec.describe "imagens/index", type: :view do
  before(:each) do
    assign(:imagens, [
      Imagem.create!(
        :produto => nil
      ),
      Imagem.create!(
        :produto => nil
      )
    ])
  end

  it "renders a list of imagens" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
