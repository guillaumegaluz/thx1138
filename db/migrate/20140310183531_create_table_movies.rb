class CreateTableMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.text :title
      t.integer :release_year
      t.text :production_company
      t.text :distributor
      t.text :director
      t.text :writer
      t.text :actor_1
      t.text :actor_2
      t.text :actor_3
    end
  end
end
