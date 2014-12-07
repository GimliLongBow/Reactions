Reactions::Application.routes.draw do

  devise_for :users, controllers: { sessions: "sessions", passwords: "passwords" }

	get 'admin', to: 'welcome#admin'

	namespace :admin do
		resources :users
		resources :reviews
	end

  resources :reviews, only: [:edit, :update] do
    get 'add/:permalink/:rating', action: 'add', as: :add, on: :collection
  end

	devise_scope :user do
		root to: "sessions#new"
	end
end
