class AddExpenseSubtypeToExpense < ActiveRecord::Migration[5.1]
  def change
    add_reference :expenses, :expense_subtype, foreign_key: true
  end
end
