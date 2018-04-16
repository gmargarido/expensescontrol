class Expense < ApplicationRecord
  validates :title, :value, :cost_center, presence: true
end
