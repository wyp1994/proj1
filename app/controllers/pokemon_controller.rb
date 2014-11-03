class PokemonController < ApplicationController
	def capture
		@pokemon = Pokemon.find(params[:id])
		@pokemon.trainer_id = current_trainer.id
		@pokemon.save
		redirect_to root_path
	end

	def damage
		@pokemon = Pokemon.find(params[:id])

		if @pokemon.health == 10
			@pokemon.delete
		else
			@pokemon.health = @pokemon.health - 10
			@pokemon.save
		end
		redirect_to :back
	end 

	def new
		@pokemon = Pokemon.new
	end

	def create
		@pokemon = Pokemon.new(pokemon_params)
		@pokemon.trainer_id = current_trainer.id
		@pokemon.health = 100
		@pokemon.level = 1
		if @pokemon.valid?
			@pokemon.save
			redirect_to trainer_path(current_trainer.id)
		else
			flash[:error] = @pokemon.errors.full_messages.to_sentence
			redirect_to :back
		end
	end

	private
	def pokemon_params
		params.require(:pokemon).permit(:name)
	end
end
