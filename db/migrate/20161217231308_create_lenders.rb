class CreateLenders < ActiveRecord::Migration
  def change
    create_table :lenders do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.string :password_digest
      t.integer :money

      t.timestamps null: false
    end
  end
end
