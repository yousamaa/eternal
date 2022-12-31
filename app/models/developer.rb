# frozen_string_literal: true

class Developer < User
  has_many :games, dependent: :destroy
end
