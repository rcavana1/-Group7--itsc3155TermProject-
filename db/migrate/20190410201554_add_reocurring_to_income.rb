class AddReocurringToIncome < ActiveRecord::Migration[5.2]
  def change
    add_column :incomes, :reocurring, :boolean
  end
end
