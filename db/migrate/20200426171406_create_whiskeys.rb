# typed: true
class CreateWhiskeys < ActiveRecord::Migration[6.0]
  def change
    create_table :whiskeys do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.integer :rate_taste
      t.integer :rate_color
      t.integer :rate_smokey

      t.timestamps
    end
  end
end
