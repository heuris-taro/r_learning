class UsersAuthorityDefaultZero < ActiveRecord::Migration
  def up
  	change_column_default :users, :authority, 0
  end

  def down
  end
end
