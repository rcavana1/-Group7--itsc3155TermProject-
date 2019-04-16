class BudgetsController < ApplicationController
# you are on slide 8

    # def new
    #     @account = Account.find(params[:account_id])
    #     @budget = @account.budgets.new
    # end
    
    def create
        @account = Account.find(params[:account_id])
        @budget = @account.budgets.create(budget_params)
        @budget.total=0.0
        @budget.save
        
        redirect_to account_path(@account)
        # if @budget.save
        #     redirect_to @budget
        # else
        #     render 'new'
        # end
    end
    
    def show
        @budget = Budget.find(params[:id])
        @account = Account.find(@budget.account_id)
        
        # commented out pending relevant models and
        # @incomes = Income.all
        # @expenses = Expenses.all
    end

    # def index
    #     @budgets = Budget.all
    # end
    
    def edit
        @budget = Budget.find(params[:id])
        @account = Account.find(@budget.account_id)
    end

    def update
        @budget = Budget.find(params[:id])
        @account = Account.find(@budget.account_id)
        if @budget.update(budget_params)
            redirect_to account_path(@account)
        else
            render 'edit'
        end
    end
    
    def destroy
        @budget = Budget.find(params[:id])
        @account = Account.find(@budget.account_id)
        @budget.destroy
        
        redirect_to account_path(@account)
    end
    
end

private
    def budget_params
        params.require(:budget).permit(:month, :target, :total)
    end
    