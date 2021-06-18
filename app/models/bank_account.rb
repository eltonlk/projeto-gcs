class BankAccount < ApplicationRecord
  multi_tenant :user

  validates :name, presence: true, uniqueness: true
end
