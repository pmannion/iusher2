class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :profile_name
      t.string :email
      t.string :password
      t.string :trust_level, :not_null => true, :default => "trusted"
      t.string :user_type, :not_null => true, :default => "regular"

      t.timestamps
    end
  end
end
