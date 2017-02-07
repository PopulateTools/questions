Rails.application.routes.draw do
  if Rails.env.development?
    get '/sandbox' => 'sandbox#index'
    get '/sandbox/*template' => 'sandbox#show'
  end

  root to: 'welcome#index'

  resource :session, only: [:create]

  resources :decks, only: [:show], path: '' do
    defaults format: :json do
      namespace :api do
        resource :question, only: [:show] do
          resources :answers, only: [:create]
        end
      end
    end
  end
end
