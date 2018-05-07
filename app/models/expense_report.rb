class ExpenseReport < ApplicationRecord
  validates :title, :start_date, :end_date, presence: true
  belongs_to :user
  has_many :expenses
end
