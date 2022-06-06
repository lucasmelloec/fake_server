class CreateExpectations < ActiveRecord::Migration[7.0]
  def change
    create_table :expectations do |t|
      t.string :path, null: false
      t.string :url_param
      t.references :domain, null: false, foreign_key: true, index: true

      t.index [:path, :url_param, :domain_id], unique: true

      t.timestamps
    end
  end
end
