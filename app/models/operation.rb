class Operation < ApplicationRecord
  include I18n::Alchemy

  multi_tenant :user

  belongs_to :bank_account

  has_and_belongs_to_many :tags

  validates :description, presence: true
  validates :due_at     , presence: true

  before_save :set_amount_by_flow_in

  default_scope -> { order(:due_at) }

  def amount
    (@amount || original_amount).to_f.abs
  end

  def original_amount
    read_attribute :amount
  end

  private
    def set_amount_by_flow_in
      write_attribute :amount, amount * (flow_in? ? 1 : -1)
    end
end
