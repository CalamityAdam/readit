Rails.application.routes.draw do
  resources :posts, only: [:index, :show, :new, :create] do

    resources :comments, only: [:create,] do
    end
  end
end
