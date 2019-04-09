class ExpensesController < ApplicationController
    def new 
        @expense = Expense.new
    end
    
    def create
        @expense = Expense.new(expense_params)
        
        
        if @expense.save
    
            redirect_to :action => 'list'
        else
            render :action => 'new'
        end
    end
    
    def edit
        @expense =  Expense.find(params[:id])
    end
    
    def update
        @expense = Expense.find(params[:id])
        
        if @expense.update_attributes(expense_param)
            redirect_to :action => 'show', :id => @expense
        else
        render :action => 'edit'
        end
    end
    
    def destroy
        Expense.find(params[:id]).destroy
        redirect_to :action => 'list'
    end
    
    def show
        @expense = Expense.find(params[:id])
    end
    
    def list
        @expense = Expense.all
    end
    
    def show_reocurring
        @reocurring = Expense.find(params[:id])
    end
    
     def show_stable
        @stable = Expense.find(params[:id])
    end
    
    private
    def expense_params
        params.require(:expense).permit(:names, :target, :amount, :reocurring, :stable)
    end
end
