FactoryGirl.define do
  factory :municipio do
    nome "Erechim"
    association :unidade_federativa
  end
end
