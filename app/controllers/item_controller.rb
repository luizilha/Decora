class ItemController < ApplicationController
	def lista
		@itens = Item.order(id_item: :desc)
	end

	def listaDaCategoria
		@categoria = Categoria.find(params[:id])
		@itens = Item.where('id_categoria = ?', params[:id]).order(id_item: :desc)
	end

	def novo
		@item = Item.new(id_categoria: params[:id])
	end

	def cria
		@item = Item.new params_item
		@item.save
	 	redirect_to action: 'listaDaCategoria', id: params_item[:id_categoria]
	end

	def edita
		@item = Item.find(params[:id])
		@categoria = Categoria.find(@item.id_categoria)
		@categorias = Categoria.all

	end

	def altera
		@item = Item.find(params[:id])
		@item.update_attributes params_item
		redirect_to action: 'listaDaCategoria', id: @item.id_categoria
	end

	def deleta
		@item = Item.find(params[:id])
		@item.destroy
		redirect_to action: 'listaDaCategoria', id: params[:id_categoria]
	end

	def params_item
		params.require(:item).permit(:nome, :descricao, :preco, :preco_reposicao, :id_categoria, :foto)
	end
end
