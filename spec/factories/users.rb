FactoryGirl.define do
  factory :user do
    email 'teste@teste.com'
    password '123123'
    password_confirmation '123123'
    role 0
  end
end
