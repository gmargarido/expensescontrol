class CreateExpenseReports < ActiveRecord::Migration[5.1]
  def change
    create_table :expense_reports do |t|
      t.string :title
      t.date :start_date
      t.date :end_date
      t.boolean :own_car

      t.timestamps
    end
  end
end
