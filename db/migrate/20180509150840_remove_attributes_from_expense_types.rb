class RemoveAttributesFromExpenseTypes < ActiveRecord::Migration[5.1]
  def change
    remove_column :expense_types, :accounting_account, :string
  end
end
