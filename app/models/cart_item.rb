class CartItem < ApplicationRecord
  belongs_to :game
  belongs_to :cart

  validates :quantity, presence: true
end
