# frozen_string_literal: true

class Game < ApplicationRecord
  belongs_to :developer, class_name: 'User'

  enum status: { approved: 'approved', not_approved: 'not_approved' }

  has_many :users, through: :game_users
  has_many :reviews, dependent: :destroy
  has_many_attached :files
end
