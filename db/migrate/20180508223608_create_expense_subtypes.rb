class CreateExpenseSubtypes < ActiveRecord::Migration[5.1]
  def change
    create_table :expense_subtypes do |t|
      t.string :description
      t.string :accounting_account

      t.timestamps
    end
  end
end
