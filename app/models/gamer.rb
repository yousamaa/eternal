# frozen_string_literal: true

class Gamer < User
  has_many :games, through: :game_users
end
