class AddPicToUsers < ActiveRecord::Migration
  def change
    add_attachment :users, :pic
  end
end
