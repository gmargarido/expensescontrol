class Expense < ApplicationRecord
  validates :value, presence: true
  belongs_to :expense_report
  belongs_to :expense_subtype
end
