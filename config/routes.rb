Rails.application.routes.draw do
  if Rails.env.development?
    get '/sandbox' => 'sandbox#index'
    get '/sandbox/*template' => 'sandbox#show'
  end

  root to: redirect('/corrupcion')

  resource :session, only: [:create]
  post 'user_token' => 'user_token#create', as: :user_token

  resources :decks, only: [:show], path: '' do
    member do
      get 'end' => 'decks#finished'
    end
  end

  namespace :api do
    defaults format: :json do
      resources :decks, only: [:show], path: '' do
        resource :question, only: [:show]
        resources :questions, only: [:show] do
          resources :answers, only: [:create]
        end
      end
    end
  end
end
