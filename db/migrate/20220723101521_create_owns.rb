class CreateOwns < ActiveRecord::Migration[7.0]
  def up
    create_table :owns do |t|
      t.references :menu, null: false, foreign_key: true
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
  
  def down
    drop_table :owns
  end
end
