class AddExpenseReportToExpenses < ActiveRecord::Migration[5.1]
  def change
    add_reference :expenses, :expense_report, foreign_key: true
  end
end
