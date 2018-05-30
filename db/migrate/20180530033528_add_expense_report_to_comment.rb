class AddExpenseReportToComment < ActiveRecord::Migration[5.1]
  def change
    add_reference :comments, :expense_report, foreign_key: true
  end
end
