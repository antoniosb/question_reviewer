class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :comment
      t.references :question, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end
