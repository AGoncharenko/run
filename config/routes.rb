Rails.application.routes.draw do
  get 'main/index'
  get 'where/:slug' => 'main#where', as: :where
  patch 'update_where/:id' => 'main#update_where', as: :update_where
  get 'build_track/:slug' => 'main#build_track', as: :build_track
  get 'when/:slug' => 'main#when', as: :when
  patch 'update_when/:id' => 'main#update_when', as: :update_when
  get 'who/:slug' => 'main#who', as: :who
  patch 'update_who/:slug' => 'main#update_who', as: :update_who
  post 'create_run' => 'main#create_run'
  get 'entry' => 'main#entry', as: :entry
  root 'main#index'
  resources :tracks

  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations" }
end
