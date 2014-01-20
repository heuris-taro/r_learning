class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.integer :question_id, null: false
      t.integer :choice_number
      t.text :description

      t.timestamps
    end
  end
end
