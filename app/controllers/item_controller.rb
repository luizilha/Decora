class ItemController < ApplicationController
	before_action :authenticate_usuario!, :except => [:listaDaCategoria]

	def lista
		@itens = Item.order(:nome)
		@categorias = Categoria.all.select('nome','id_categoria').as_json
	end

	def listaDaCategoria
		@categoria = Categoria.find(params[:id])
		@itens = Item.where('id_categoria = ?', params[:id]).order(alteracao: :asc)
		respond_to do |format|
		  format.html
		  format.json { render json: @itens.as_json(only: [:nome, :descricao], methods: [:foto_url]) }
		end
	end

	def novo
		@item = Item.new(id_categoria: params[:id])
	end

	def cria
		@item = Item.new params_item
		@item.alteracao = Time.now

		if @item.save
	 		redirect_to action: 'lista'
		else
			render action: 'novo'
		end
	end

	def edita
		@item = Item.find(params[:id])
		@categoria = Categoria.find(@item.id_categoria)
		@categorias = Categoria.all
	end

	def altera
		@item = Item.find(params[:id])
		@item.alteracao = Time.now
		if @item.update_attributes params_item
			redirect_to action: 'listaDaCategoria', id: @item.id_categoria
		else
			render action: 'edita'
		end
	end

	def deleta
		@item = Item.find(params[:id])
		@item.destroy
		redirect_to action: 'lista'
	end

	def params_item
		params.require(:item).permit(:nome, :descricao, :preco, :preco_reposicao, :id_categoria, :foto, :quantidade)
	end
end
