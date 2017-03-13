Rails.application.routes.draw do

  resources :enderecos, only: [:new, :create]

  resources :marcas

  resources :pedidos, only: :index do
    collection do
      get :finalizar_pedido
      post :criar_pedido
      get :todos_pedidos
    end
  end

  resources :categorias

  devise_for :users

  resources :produtos do
    resources :comentarios, only: [:create, :destroy, :update]
  end

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
