class CreatePokemons < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemons do |t|
      t.text :name
      t.integer :pokemon_id
      t.text :image_url
      t.text :pokemon_type

      t.timestamps
    end
  end
end
