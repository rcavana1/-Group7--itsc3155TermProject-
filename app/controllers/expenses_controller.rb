class ExpensesController < ApplicationController
   
    def new
        @budget = Budget.find(params[:budget_id])
        @expense = @budget.expenses.new
    end
    
    def create
        @budget = Budget.find(params[:budget_id])
        @expense = @budget.expenses.create(expense_params)
        
        if @expense.save
            tally_budget
            redirect_to budget_path(@budget)
        else
            render 'new'
        end
    end
    
    def edit
        @expense = Expense.find(params[:id])
        @budget = Budget.find(@expense.budget_id)
    end
    
    def update
        @expense = Expense.find(params[:id])
        @budget = Budget.find(@expense.budget_id)
        if @expense.update(expense_params)
            tally_budget
            redirect_to @budget
        else
            render 'edit'
        end
    end
    
    def destroy
        @expense = Expense.find(params[:id])
        @budget = Budget.find(@expense.budget_id)
        @expense.destroy
        tally_budget
        redirect_to budget_path(@budget)
    end
    
    def show
        @expense = Expense.find(params[:id])
        @budget = Budget.find(@expense.budget_id)
    end
    
end

  private
  
    def expense_params
        params.require(:expense).permit(:names, :target, :amount, :reocurring, :stable)
    end
    
    def tally_budget
        @budget.total = 0.0 + @budget.incomes.sum('amount') - @budget.expenses.sum('amount')
        @budget.save
    end