RailsQuiz::Application.routes.draw do  
  root 'participants#index'

  resources :participants, only: [:index, :show]
  resources :drawings, only: [:index, :create]
end
