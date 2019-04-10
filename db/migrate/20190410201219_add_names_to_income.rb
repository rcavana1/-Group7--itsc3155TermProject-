class AddNamesToIncome < ActiveRecord::Migration[5.2]
  def change
    add_column :incomes, :names, :string
  end
end
