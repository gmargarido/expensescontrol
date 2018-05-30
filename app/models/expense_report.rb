class ExpenseReport < ApplicationRecord
  validates :title, :start_date, :end_date, presence: true
  belongs_to :user
  has_many :expenses
  has_many :comments
  enum status: { saved: 0, submitted: 1, approved: 2, rejected: 3, finished: 4 }
end
