# frozen_string_literal: true

class Game < ApplicationRecord
  belongs_to :developer, class_name: 'User'

  enum status: { approved: 'approved', not_approved: 'not_approved' }

  has_many :users, through: :game_users
  has_many :reviews, dependent: :destroy
  has_many_attached :images
  has_one_attached :thumbnail
  has_one_attached :game_file
  has_one_attached :demo
  has_many :cart_items, dependent: :destroy
  has_many :carts, through: :cart_items

  validates :name, :price, presence: true
end
