class Expense < ApplicationRecord
  validates :title, :value, :cost_center, presence: true
  belongs_to :expense_report
end
