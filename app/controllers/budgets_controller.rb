class BudgetsController < ApplicationController

    def new
        @budget = Budget.new
    end
    
    def create
        @budget = Budget.new(budget_params)
        @budget.total=0.0
        
        if @budget.save
            redirect_to @budget
        else
            render 'new'
        end
    end
    
    def show
        @budget = Budget.find(params[:id])
        
        # commented out pending relevant models and
        # @incomes = Income.all
        # @expenses = Expenses.all
    end

    def index
        @budgets = Budget.all
    end
end

private
    def budget_params
        params.require(:budget).permit(:month, :target, :total)
    end
    