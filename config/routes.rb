Prognosticator::Application.routes.draw do
	resources :predictions
	match '/:controller(/:action(/:id))'
	match 'all' => 'Predictions#index', :as => "all_predictions"
	match ':name' => 'Prediction#index', :as => 'prediction'
end
