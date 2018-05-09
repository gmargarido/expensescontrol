class ExpenseSubtype < ApplicationRecord
  belongs_to :expense_type
  has_many :expenses
  validates :description, :accounting_account, presence: true
end
