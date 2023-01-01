# frozen_string_literal: true

class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :rating,  null: false, default: 0
      t.string :comment,  null: false, default: ''
      t.references :user, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
