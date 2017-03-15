FactoryGirl.define do
  factory :imagem do
    association :produto
    imagem { fixture_file_upload(Rails.root.join('spec', 'photos', 'test.png'), 'image/png') }
    imagem { File.new("/home/wonder/Downloads/mz.jpg") } 
  end
end
