class AddArrivalCntToUsers < ActiveRecord::Migration
  def change
    add_column :users, :arrival_cnt, :integer, default: 0
  end
end
