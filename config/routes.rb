Thx1138::Application.routes.draw do
  root 'movies#index'
  get 'shootings/:movie_id', to: 'shootings#show'
end
