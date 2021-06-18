class Tag < ApplicationRecord
  multi_tenant :user

  validates :name, presence: true, uniqueness: true

  default_scope -> { order(:name) }
end
