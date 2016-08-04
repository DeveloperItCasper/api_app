# frozen_string_literal: true
class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :url, null: false
      t.string :headers, array: true, default: []
      t.string :links, array: true, default: []

      t.timestamps null: false
    end
  end
end
