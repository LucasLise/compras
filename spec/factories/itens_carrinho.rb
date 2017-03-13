FactoryGirl.define do
  factory :item_carrinho do
    association :carrinho
    association :produto
    quantidade 10
  end
end
