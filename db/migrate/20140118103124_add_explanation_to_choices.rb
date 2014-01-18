class AddExplanationToChoices < ActiveRecord::Migration
  def change
    add_column :choices, :explanation, :text
  end
end
