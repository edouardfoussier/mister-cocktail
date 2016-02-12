class AddXToCocktail < ActiveRecord::Migration
  def change
    add_column :cocktails, :x, :integer
  end
end
