class RemoveAttributesFromExpenses < ActiveRecord::Migration[5.1]
  def change
    remove_column :expenses, :cost_center, :string
    remove_column :expenses, :title, :string
  end
end
