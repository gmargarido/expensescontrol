class ExpenseType < ApplicationRecord
  has_many :expense_subtypes
end
