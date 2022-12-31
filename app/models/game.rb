# frozen_string_literal: true

class Game < ApplicationRecord
  belongs_to :developer, class_name: 'User'

  has_many :users, through: :game_users
end
