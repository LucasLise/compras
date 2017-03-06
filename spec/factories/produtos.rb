FactoryGirl.define do
  factory :produto do
    descricao 'Notebook'
    preco 1232
    quantidade 213
    association :categoria
  end
end
