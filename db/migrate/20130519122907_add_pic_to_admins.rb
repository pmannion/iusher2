class AddPicToAdmins < ActiveRecord::Migration
  def change
    add_attachment :admins, :pic
  end
end
