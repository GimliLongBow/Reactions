Reactions::Application.routes.draw do

	get 'admin', to: 'welcome#admin'
	namespace :admin do
		resource :user
		resource :feedback
	end


	root 'welcome#index'
end
