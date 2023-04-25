Rails.application.routes.draw do
  root controller: "client/home", action: "index"
  resources :stories, controller: "client/stories", only: :show
  resources :chapters, controller: "client/chapters", only: :show
end
