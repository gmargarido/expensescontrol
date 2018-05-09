class ExpenseSubtype < ApplicationRecord
  belongs_to :expense_type
  has_many :expenses
end
