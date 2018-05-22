class AddFieldsToCustomer < ActiveRecord::Migration[5.1]
  def change
    add_column :customers, :social_name, :string
  end
end
