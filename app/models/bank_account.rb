class BankAccount < ApplicationRecord
  multi_tenant :user

  validates :name, presence: true, uniqueness: true

  def destroy_and_replace! form
    if form.valid?

      self.destroy
    end
  end
end
