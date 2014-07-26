Reactions::Application.routes.draw do
	resource :user

	root 'feedback#new'
end
