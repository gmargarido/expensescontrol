class ExpenseType < ApplicationRecord
  has_many :expense_subtypes
  validates :description, presence: true
end
