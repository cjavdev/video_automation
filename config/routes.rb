Rails.application.routes.draw do
  devise_for :users
  root 'videos#index'

  resources :videos do
    member do
      post :sync
      post :thumb_upload
      get :thumb
    end
  end

  resources :video_recordings
  resources :categories
  resources :presenters
  resources :description_templates

  # Authenticate to a YouTube Channel.
  get '/youtube_sessions', to: 'youtube_sessions#new'
  get '/youtube_sessions/callback', to: 'youtube_sessions#callback'
end
