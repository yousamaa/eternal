# frozen_string_literal: true

class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.integer :quantity, null: false, default: 1
      t.references :game,  null: false, foreign_key: true
      t.references :cart,  null: false, foreign_key: true

      t.timestamps
    end
  end
end
