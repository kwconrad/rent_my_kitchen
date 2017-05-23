class AddUserToUserAccount < ActiveRecord::Migration[5.0]
  def change
    add_reference :user_accounts, :user, foreign_key: true
  end
end
