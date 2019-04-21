class ExpensesController < ApplicationController
    def new
        @budget = Budget.find(params[:budget_id])
        @expense = @budget.expenses.new
    end
    
    def create
        @budget = Budget.find(params[:budget_id])
        @expense = @budget.expenses.create(expense_params)
        redirect_to budget_path(@budget)
        # @expense = Expense.new(expense_params)
        # if @expense.save
        #     redirect_to @expense
        # else
        #     render 'new'
        # end
    end
    
    def edit
        @budget = Budget.find(params[:id])
        @expense = Expense.find(params[:budget_id])
    end
    
    # def index
    #     @expenses = Expense.all
    # end
    
    def update
        @budget = Budget.find(params[:id])
        @expense = Expense.find(params[:budget_id])
        if @expense.update(expense_params)
            redirect_to @budget
        else
            render 'edit'
        end
    end
    
    def destroy
        @budget = Budget.find(params[:id])
        @expense = Expense.find(params[:budget_id])
        @expense.destroy
        
        redirect_to budget_path(@budget)
    end
    
    def show
        @budget = Budget.find(params[:id])
        @expense = Expense.find(params[:budget_id])
    end
    
    
  
end
  private
    def expense_params
        params.require(:expense).permit(:names, :target, :amount, :reocurring, :stable)
    end