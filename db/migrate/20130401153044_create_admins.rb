class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :company
      t.string :branch
      t.decimal :longitude
      t.decimal :latitude
      t.string :email

      t.timestamps
    end
  end
end
