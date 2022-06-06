class CreateResponses < ActiveRecord::Migration[7.0]
  def change
    create_table :responses do |t|
      t.string :body, null: false
      t.string :format, null: false
      t.integer :code, null: false
      t.references :expectation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
