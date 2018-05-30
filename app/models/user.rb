class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :expense_reports
  has_many :customers
  has_many :comments
  enum profile: { salesman: 0, approver: 2, admin: 4 }
end
