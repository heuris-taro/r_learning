class AddTrialCntToUsers < ActiveRecord::Migration
  def change
    add_column :users, :trial_cnt, :integer, default: 0
  end
end
