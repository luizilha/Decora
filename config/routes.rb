Rails.application.routes.draw do
  devise_for :admins, path: "/", path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }

  root 'categoria#index'
  match 'categorias/novo' => 'categoria#novo', via: 'get'
  match '/' => 'categoria#cria', via: 'post'
end
