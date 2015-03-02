class CreateUserInRequests < ActiveRecord::Migration
  def change
    create_table :user_in_requests do |t|
      t.integer :user_id
      t.integer :request_id

      t.timestamps
    end
  end
end
