FactoryGirl.define do
  factory :imagem do
    association :produto
    imagem { File.new("#{Rails.root}/spec/support/imagens/teste.jpg") }
  end
end
