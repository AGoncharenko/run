Rails.application.routes.draw do
  devise_for :users
  get 'main/index'
  get 'where/:slug' => 'main#where', as: :where
  get 'build_track/:slug' => 'main#build_track', as: :build_track
  get 'when/:slug' => 'main#when', as: :when
  post 'create_run' => 'main#create_run'
  get 'entry' => 'main#entry', as: :entry
  root 'main#index'
  resources :tracks
end
