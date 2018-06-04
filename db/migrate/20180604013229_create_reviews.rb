class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :comment
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
