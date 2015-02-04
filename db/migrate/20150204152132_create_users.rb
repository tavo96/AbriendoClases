class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_hash
      t.string :password_salt
      t.integer :cuenta
      t.string :telefono
      t.text :informacion_adicional

      t.timestamps
    end
  end
end
