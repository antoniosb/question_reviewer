class AddStatusToQuestion < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :status, :integer, default: 0
  end
end
