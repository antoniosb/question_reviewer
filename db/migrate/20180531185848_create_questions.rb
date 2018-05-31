class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :content
      t.string :source
      t.string :year
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
