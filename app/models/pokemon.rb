class Pokemon < ApplicationRecord
  validates_uniqueness_of :pokemon_id, :name
  validates_presence_of :pokemon_id, :name
end
