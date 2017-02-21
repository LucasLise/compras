Rails.application.routes.draw do
  resources :produtos

  resources :galeria, only: :index

  resources :carrinhos, only: :index do
    post :adiciona_produto_carrinho
  end 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
