# frozen_string_literal: true

class AddStatusToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :status, :string, default: 'not_approved', null: false
  end
end
