# frozen_string_literal: true

class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :name,           null: false, default: ''
      t.integer :price,         null: false, default: 0
      t.string :category
      t.string :description
      t.references :developer, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
