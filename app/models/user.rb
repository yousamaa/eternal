# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum type: { admin: 'admin', developer: 'developer', gamer: 'gamer' }
end
