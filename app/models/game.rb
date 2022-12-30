class Game < ApplicationRecord
  belongs_to :developer, class_name: 'User'
end
