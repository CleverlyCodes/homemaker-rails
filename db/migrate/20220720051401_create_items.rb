class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.references :ingredient, null: false, foreign_key: true
      t.integer :quantity
      t.string :unit
      t.datetime :expired_by
      t.datetime :bought_by
      t.datetime :production_date

      t.timestamps
    end
  end
end
