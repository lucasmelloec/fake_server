class CreateDomains < ActiveRecord::Migration[7.0]
  def change
    create_table :domains do |t|
      t.string :name, null: false
      t.string :path, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
