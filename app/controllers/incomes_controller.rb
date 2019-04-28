class IncomesController < ApplicationController
    
    def new 
        @budget = Budget.find(params[:budget_id])
        @income = @budget.incomes.new
    end
    
    def create
        @budget = Budget.find(params[:budget_id])
        @income = @budget.incomes.create(income_params)
        
        if @income.save
            tally_budget
            redirect_to budget_path(@budget)
        else
            render 'new'
        end
    end
    
    def edit
        @income = Income.find(params[:id])
        @budget = Budget.find(@income.budget_id)
    end
   
    def update
        @income = Income.find(params[:id])
        @budget = Budget.find(@income.budget_id)
        if @income.update(income_params)
            tally_budget
            redirect_to @budget
        else
            render 'edit'
        end
    end
    
    def destroy
        @income = Income.find(params[:id])
        @budget = Budget.find(@income.budget_id)
        @income.destroy
        tally_budget
        redirect_to budget_path(@budget)
    end
    
    def show
        @income = Income.find(params[:id])
        @budget = Budget.find(@income.budget_id)
    end
    
end

  private
  
    def income_params
        params.require(:income).permit(:names, :target, :amount, :reocurring, :stable)
    end
    
    def tally_budget
        @budget.total = 0.0 + @budget.incomes.sum('amount') - @budget.expenses.sum('amount')
        @budget.save
    end