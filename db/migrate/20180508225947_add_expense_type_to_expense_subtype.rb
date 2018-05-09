class AddExpenseTypeToExpenseSubtype < ActiveRecord::Migration[5.1]
  def change
    add_reference :expense_subtypes, :expense_type, foreign_key: true
  end
end
