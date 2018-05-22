class Expense < ApplicationRecord
  validates :value, presence: true
  belongs_to :expense_report
  belongs_to :expense_subtype
  belongs_to :customer, optional: true
end
