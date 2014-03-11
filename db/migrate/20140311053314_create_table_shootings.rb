class CreateTableShootings < ActiveRecord::Migration
  def change
    create_table :shootings do |t|
      t.integer :movie_id
      t.text :locations
      t.text :fun_fact
    end
  end
end
