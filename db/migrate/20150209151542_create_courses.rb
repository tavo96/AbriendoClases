class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :requirements
      t.string :recommended_requirements

      t.timestamps
    end
  end
end
