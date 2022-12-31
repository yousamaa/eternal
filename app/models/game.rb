# frozen_string_literal: true

class Game < ApplicationRecord
  belongs_to :developer, class_name: 'User'

  has_many :gamers, through: :game_users, class_name: 'User'
end
