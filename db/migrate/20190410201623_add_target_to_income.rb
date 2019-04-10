class AddTargetToIncome < ActiveRecord::Migration[5.2]
  def change
    add_column :incomes, :target, :float
  end
end
