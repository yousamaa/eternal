# frozen_string_literal: true

class CartItem < ApplicationRecord
  belongs_to :game
  belongs_to :cart
end
