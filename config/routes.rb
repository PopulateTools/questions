Rails.application.routes.draw do
  if Rails.env.development?
    get '/sandbox' => 'sandbox#index'
    get '/sandbox/*template' => 'sandbox#show'
  end

  root to: 'welcome#index'

  resources :decks, only: [:show], path: '' do
    resource :question, only: [:show] do
      resources :answers, only: [:create]
    end
  end
end
