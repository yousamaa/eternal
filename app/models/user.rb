# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum type: { Admin: 'admin', Developer: 'developer', Gamer: 'gamer' }
end
