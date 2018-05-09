class CreateExpenseTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :expense_types do |t|
      t.string :description
      t.string :accounting_account

      t.timestamps
    end
  end
end
