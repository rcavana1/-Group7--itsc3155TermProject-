class BudgetsController < ApplicationController
# you are on slide 5

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
    
    def edit
        @budget = Budget.find(params[:id])
    end

    def update
        @budget = Budget.find(params[:id])
        if @budget.update(budget_params)
            redirect_to @budget
        else
            render 'edit'
        end
    end
    
    def destroy
        @budget = Budget.find(params[:id])
        @budget.destroy
        
        redirect_to budgets_path
    end
    
end

private
    def budget_params
        params.require(:budget).permit(:month, :target, :total)
    end
    