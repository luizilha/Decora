Rails.application.routes.draw do
  devise_for :usuario

  root 'categoria#index'
  match 'categoria/novo' => 'categoria#novo', via: 'get'
  match '/' => 'categoria#cria', via: 'post'
  match 'categoria/deleta/:id' => 'categoria#deleta', via: 'get'
  match 'categoria/edita/:id' => 'categoria#edita', via: 'get'
  match 'categoria/edita/:id' => 'categoria#altera', via: 'put'

  match 'itens' => 'item#lista', via: 'get'
  match 'itens/:id' => 'item#listaDaCategoria', via: 'get'
  match 'item/novo/:id' => 'item#novo', via: 'get'
  match 'item/novo' => 'item#novo', via: 'get'
  match 'itens/:id' => 'item#cria', via: 'post', path: 'cria'
  match 'item/deleta/:id/:id_categoria' => 'item#deleta', via: 'get'
  match 'item/edita/:id' => 'item#edita', via: 'get'
  match 'item/edita/:id' => 'item#altera', via: 'put'

end
