Rails.application.routes.draw do
  devise_for :admins, path: "/", path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }

  root 'categoria#index'
  match 'categoria/novo' => 'categoria#novo', via: 'get'
  match '/' => 'categoria#cria', via: 'post'
  match 'categoria/deleta/:id' => 'categoria#deleta', via: 'get'
  match 'categoria/edita/:id' => 'categoria#edita', via: 'get'
  match 'categoria/edita/:id' => 'categoria#altera', via: 'put'
end
