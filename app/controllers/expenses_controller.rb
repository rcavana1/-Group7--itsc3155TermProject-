class ExpensesController < ApplicationController
    def new 
        @expense = Expense.new
    end
    
    def create
        @expense = Expense.new(expense_params)
        
        
        if @expense.save
    
            redirect_to @expense
        else
            render 'new'
        end
    end
    
    def edit
        @expense =  Expense.find(params[:id])
    end
    
    def index
        @expenses = Expense.all
    end
    
    def update
        @expense = Expense.find(params[:id])
        
        if @expense.update(expense_params)
            redirect_to @expense
        else
            render 'edit'
        end
    end
    
    def destroy
        @expense = Expense.find(params[:id])
        @expense.destroy
        
        redirect_to expenses_path
    end
    
    def show
        @expense = Expense.find(params[:id])
    end
    
    
  
end
  private
    def expense_params
        params.require(:expense).permit(:names, :target, :amount, :reocurring, :stable)
    end