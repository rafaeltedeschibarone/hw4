Rails.application.routes.draw do
  get("/", { :controller => "places", :action => "index" })
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources "entries"
  resources "places"
  resources "users"
end
