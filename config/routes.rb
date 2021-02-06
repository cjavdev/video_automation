Rails.application.routes.draw do
  root 'videos#index'

  resources :videos do
    member do
      post :sync
    end
  end

  resources :presenters
  resources :description_templates

  # Authenticate to a YouTube Channel.
  get '/youtube_sessions', to: 'youtube_sessions#new'
  get '/youtube_sessions/callback', to: 'youtube_sessions#callback'
end
