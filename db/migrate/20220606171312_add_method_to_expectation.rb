class AddMethodToExpectation < ActiveRecord::Migration[7.0]
  def change
    add_column :expectations, :method, :string

    reversible do |direction|
      direction.up do
        Expectation.where(method: nil).update!(method: 'GET')
      end
    end
    change_column_null :expectations, :method, false
  end
end
