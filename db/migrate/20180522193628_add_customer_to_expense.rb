class AddCustomerToExpense < ActiveRecord::Migration[5.1]
  def change
    add_reference :expenses, :customer, foreign_key: true
  end
end
