FactoryGirl.define do
  factory :endereco do
    logradouro "rua"
    numero 1
    complemento "centro"
    bairro "Progresso"
    cep "12312312"
    rua 'Pedro Pinto De Souza'
    association :user
    association :municipio
    association :unidade_federativa
  end
end
