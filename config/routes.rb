Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "calendar#index"
  get "calendar/delete/:id", to: "calendar#delete", id: :id
  get "calendar/edit/:id", to: "calendar#edit", id: :id
  get "calendar/add/:id", to: "calendar#add", id: :id
  get "calendar/:id", to: "calendar#show", id: :id
end
