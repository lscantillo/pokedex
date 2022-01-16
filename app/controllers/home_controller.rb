class HomeController < ApplicationController
  def index
    @pagy, @pokemons =  pagy(Pokemon.all, items: 10)
  end
end
