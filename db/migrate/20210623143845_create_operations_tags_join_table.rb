class CreateOperationsTagsJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :operations, :tags
  end
end
