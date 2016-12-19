class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.integer :amount
      t.references :lender, index: true
      t.references :borrower, index: true

      t.timestamps null: false
    end
    add_foreign_key :histories, :lenders
    add_foreign_key :histories, :borrowers
  end
end
