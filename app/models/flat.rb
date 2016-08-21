class Flat < ApplicationRecord
  validates_presence_of :number, :floor, :entrance
end
