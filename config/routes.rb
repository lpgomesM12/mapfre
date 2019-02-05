Rails.application.routes.draw do
  resources :coberturas
  resources :apolices
  resources :aditivos
  root 'static#home'
  #root 'apolices#home'
  get 'apolices/relatorio'
  get "/relatorio", to: "apolices#relatorio", as: :relatorio
  get "/relatorionovo", to: "apolices#relatorionovo", as: :relatorionovo


  get "/relatorioaditivo", to: "aditivos#relatorio", as: :relatorioaditivo

  get "/home", to: "static#home", as: :home

  
  match '/addservico', to: 'apolices#add_servico', via: 'get'
  match '/buscaservico', to: 'apolices#busca_servico', via: 'get'
  match '/deletaservico', to: 'apolices#deleta_servico', via: 'get'
  match '/coberturas_apolice', to: 'apolices#coberturas_apolice', via: 'get'
  match '/alteracobertura', to: 'apolices#alterar_cobertura', via: 'get'
  match '/deletecobertura', to: 'apolices#delete_cobertura', via: 'get'
  match '/addcobertura', to: 'apolices#add_cobertura', via: 'get'



end
