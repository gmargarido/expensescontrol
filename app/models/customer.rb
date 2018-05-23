class Customer < ApplicationRecord
  validates :name, :social_name, :cnpj, presence: true
  has_many :expenses
  belongs_to :user
end
