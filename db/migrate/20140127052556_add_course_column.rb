class AddCourseColumn < ActiveRecord::Migration
  def change
    add_column :questions, :course, :string
  end

end
