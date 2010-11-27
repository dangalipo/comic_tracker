ComicTracker::Application.routes.draw do
  resources :issues
  resources :series
  root :to => "series#index" 
end
