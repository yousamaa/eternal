# frozen_string_literal: true

class CreateGameUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :game_users do |t|
      t.references :game,  null: false, foreign_key: true
      t.references :gamer, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
