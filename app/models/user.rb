# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum type: { Admin: 'admin', Developer: 'developer', Gamer: 'gamer' }

  has_many :games, through: :game_users
  has_many :reviews, dependent: :destroy
  has_one :cart, dependent: :destroy
  has_one_attached :avatar
end
