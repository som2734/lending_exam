class CreateBorrowers < ActiveRecord::Migration
  def change
    create_table :borrowers do |t|
      t.string :f_name
      t.string :l_name
      t.string :email
      t.string :password_digest
      t.integer :funds
      t.string :purpose
      t.text :description
      t.integer :raised

      t.timestamps null: false
    end
  end
end
