Rails.application.routes.draw do
  resources :apolices
  root 'apolices#index'
  get 'apolices/relatorio'
  get "/relatorio", to: "apolices#relatorio", as: :relatorio

end
