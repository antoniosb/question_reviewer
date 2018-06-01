class CreateOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :options do |t|
      t.string :content
      t.boolean :answer
      t.references :question, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end
