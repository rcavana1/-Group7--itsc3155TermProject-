class BudgetsController < ApplicationController

    def new
    end
    
    def create
        @budget = Budget.new(budget_params)
        @budget.total=0
        
        @budget.save
        redirect_to @budget
    end
    
    def show
        @budget = Budget.find(params[:id])
        
        # commented out pending relevant models and
        # @incomes = Income.all
        # @expenses = Expenses.all
    end

end

private
    def budget_params
        params.require(:budget).permit(:month, :target, :total)
    end
    