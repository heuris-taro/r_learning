class CreateCorrectAnswers < ActiveRecord::Migration
  def change
    create_table :correct_answers do |t|
      t.integer :question_id, null: false
      t.integer :choice_number

      t.timestamps
    end
  end
end
