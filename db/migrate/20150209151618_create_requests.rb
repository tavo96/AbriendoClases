class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :course_id
      t.integer :schedule_id
      t.integer :state_id

      t.timestamps
    end
  end
end
