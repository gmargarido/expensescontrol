class ExpenseReport < ApplicationRecord
  validates :title, :start_date, :end_date, presence: true
  has_many :expenses
end
