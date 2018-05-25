class AddDefaultValueToStatus < ActiveRecord::Migration[5.1]
  def up
    change_column :expense_reports, :status, :integer, default: 0
  end

  def down
    change_column :expense_reports, :status, :integer, default: 0
  end
end
