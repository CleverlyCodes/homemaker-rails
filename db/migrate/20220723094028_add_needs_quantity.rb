class AddNeedsQuantity < ActiveRecord::Migration[7.0]
  def up
    add_column :needs, :quantity, :integer, :null => false, :default => 1
    add_column :needs, :unit, :string, :null => false, :default => "pcs"
  end

  def down
    remove_column :needs, :quantity, :integer
    remove_column :needs, :unit, :string
  end
end
