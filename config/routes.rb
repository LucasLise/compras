Rails.application.routes.draw do
  resources :itens_pedido
  resources :pedidos do
    collection do
      post :criar_pedido
    end
  end
  resources :categorias
  devise_for :users

  resources :produtos

  resources :galeria, only: :index

  resources :itens_carrinho, only: :destroy

  resources :carrinhos, only: :index do
    collection do
      post :adiciona_produto_carrinho
    end
  end

  root 'galeria#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
