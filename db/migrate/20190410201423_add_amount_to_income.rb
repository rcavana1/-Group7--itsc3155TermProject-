class AddAmountToIncome < ActiveRecord::Migration[5.2]
  def change
    add_column :incomes, :amount, :float
  end
end
