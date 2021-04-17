class AddGoogleToUser < ActiveRecord::Migration[5.2]
  def change
   add_column :users, :google_token, :string
   add_column :users, :google_refresh_token, :string
   add_column :users, :uid, :string
   add_column :users, :username, :string 
   remove_column :users, :password_digest, :string
  end
end
