class AddUserToExpenseReport < ActiveRecord::Migration[5.1]
  def change
    add_reference :expense_reports, :user, foreign_key: true
  end
end
