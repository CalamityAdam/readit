Rails.application.routes.draw do
  resources :posts, only: [:index, :show, :new, :create] do
    post '/upvote', to: 'posts#upvote'
    post '/downvote', to: 'posts#downvote'
    resources :comments, only: [:create,] do
      post '/upvote', to: 'comments#upvote'
      post '/downvote', to: 'comments#downvote'
    end
  end
end
