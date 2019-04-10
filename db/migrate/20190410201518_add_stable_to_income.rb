class AddStableToIncome < ActiveRecord::Migration[5.2]
  def change
    add_column :incomes, :stable, :boolean
  end
end
