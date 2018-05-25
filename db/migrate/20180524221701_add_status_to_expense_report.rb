class AddStatusToExpenseReport < ActiveRecord::Migration[5.1]
  def change
    add_column :expense_reports, :status, :integer
  end
end
