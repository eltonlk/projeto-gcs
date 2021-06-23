class CreateOperations < ActiveRecord::Migration[6.1]
  def change
    create_table :operations do |t|
      t.references :user        , null: false, foreign_key: true
      t.boolean    :flow_in     , null: false, default: true
      t.string     :description , null: false
      t.decimal    :amount      , null: false, precision: 13, scale: 2, default: 0
      t.date       :due_at      , null: false
      t.boolean    :paid        , null: false, default: false
      t.references :bank_account, null: false, foreign_key: true
      t.text       :comment

      t.timestamps
    end
  end
end
