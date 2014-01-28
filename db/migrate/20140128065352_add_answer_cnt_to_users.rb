class AddAnswerCntToUsers < ActiveRecord::Migration
  def change
    add_column :users, :answer_cnt, :integer, default: 0
  end
end
