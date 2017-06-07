Rails.application.routes.draw do
  resources :apolices
  root 'apolices#index'
  #root 'apolices#home'
  get 'apolices/relatorio'
  get "/relatorio", to: "apolices#relatorio", as: :relatorio

  match '/addservico', to: 'apolices#add_servico', via: 'get'
  match '/buscaservico', to: 'apolices#busca_servico', via: 'get'
  match '/deletaservico', to: 'apolices#deleta_servico', via: 'get'

end
