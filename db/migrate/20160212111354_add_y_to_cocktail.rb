class AddYToCocktail < ActiveRecord::Migration
  def change
    add_column :cocktails, :y, :integer
  end
end
