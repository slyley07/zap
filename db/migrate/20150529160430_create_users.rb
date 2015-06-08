class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :username
      t.string :fname
      t.string :lname
      t.string :password
      t.string :password_confirmation
      t.string :pnumber
      t.string :city
      t.string :gender
      t.datetime :birthday
      t.string :website

      t.timestamps null: false
    end
  end
end
