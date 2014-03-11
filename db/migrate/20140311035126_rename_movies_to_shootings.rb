class RenameMoviesToShootings < ActiveRecord::Migration
  def change
    rename_table :movies, :shootings
  end
end
