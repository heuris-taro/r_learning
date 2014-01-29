class CreateArrivals < ActiveRecord::Migration
  def change
    create_table :arrivals do |t|
      t.integer :user_id
      t.integer :question_id
      t.boolean :arrival_flg

      t.timestamps
    end
  end
end
