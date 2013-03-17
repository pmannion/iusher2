class CreateComplaints < ActiveRecord::Migration
  def change
    create_table :complaints do |t|
      t.string :branch
      t.integer :screen
      t.integer :seat
      t.decimal :longitude, :decimal, {:precision=>10, :scale=>6}
      t.decimal :latitude, :decimal, {:precision=>10, :scale=>6}
      t.string :comment

      t.timestamps
    end
  end
end
