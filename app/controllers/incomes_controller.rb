class IncomesController < ApplicationController
    def new 
        @budget = Budget.find(params[:budget_id])
        @income = @budget.incomes.new
    end
    
    def create
        @budget = Budget.find(params[:budget_id])
        @income = @budget.incomes.create(income_params)
        tally_budget
        redirect_to budget_path(@budget)
        # @income = Income.new(income_params)
        # if @income.save
        #     redirect_to @income
        # else
        #     render 'new'
        # end
    end
    
    def edit
        @budget = Budget.find(params[:id])
        @income = Income.find(params[:budget_id])
    end
    
    # def index
    #     @incomes = Income.all
    # end
    
    def update
        @budget = Budget.find(params[:id])
        @income = Income.find(params[:budget_id])
        if @income.update(income_params)
            tally_budget
            redirect_to @budget
        else
            render 'edit'
        end
    end
    
    def destroy
        @budget = Budget.find(params[:id])
        @income = Income.find(params[:budget_id])
        @income.destroy
        tally_budget
        redirect_to budget_path(@budget)
    end
    
    def show
        @budget = Budget.find(params[:id])
        @income = Income.find(params[:budget_id])
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