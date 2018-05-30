class Comment < ApplicationRecord
  belongs_to :expense_report
  belongs_to :user
end
