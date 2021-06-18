class Tag < ApplicationRecord
  multi_tenant :user

  validates :name, presence: true, uniqueness: true
end
