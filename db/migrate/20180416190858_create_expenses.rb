class CreateExpenses < ActiveRecord::Migration[5.1]
  def change
    create_table :expenses do |t|
      t.string :title
      t.float :value
      t.string :cost_center

      t.timestamps
    end
  end
end
