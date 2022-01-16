class PokemonsController < ApplicationController

  def index
    @pagy, @pokemons =  pagy(Pokemon.all, items: 10)
  end

  def show
    @pokemon = find_pokemon
  end

  def create

  end

  def update

  end

  def destroy

  end

  private
  def set_params
    params.require(:pokemons).permit(:name, :pokemon_id, :image_url, :pokemon_type)
  end

  def find_pokemon
    Pokemon.find(params[:id])
  end

end
