class Customer < ApplicationRecord
  validates :name, :social_name, :cnpj, presence: true
  has_many :expenses
  belongs_to :user
  enum status: { pending: 0, active: 1, inactive: 2 }
end
