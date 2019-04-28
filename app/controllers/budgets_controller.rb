class BudgetsController < ApplicationController
# you are on slide 8

    def new
        @user = current_user
        @budget = @user.budgets.new
    end
    
    def create
        @user = current_user
        if @user.budgets.any?
            @lastBudget = @user.budgets.last
            @lastExpenses = @lastBudget.expenses
            @lastIncomes = @lastBudget.incomes
            @budget = @user.budgets.create(budget_params)
            @budget.total=0.0
            if @budget.save
                @lastIncomes.each do |income|
                    if income.reocurring
                        @income = @budget.incomes.new
                        @income.names = income.names
                        @income.reocurring = income.reocurring
                        @income.stable = income.stable
                        @income.amount = 0.0
                        if income.stable
                            @income.amount = income.amount
                        end
                        @income.save
                    end
                end
                @lastExpenses.each do |expense|
                    if expense.reocurring
                        @expense = @budget.expenses.new
                        @expense.names = expense.names
                        @expense.target = expense.target
                        @expense.reocurring = expense.reocurring
                        @expense.stable = expense.stable
                        @expense.amount = 0.0
                        if expense.stable
                            @expense.amount = expense.amount
                        end
                        @expense.save
                    end
                end
                tally_budget
                redirect_to user_budgets_path(@user)
            else
                render 'new'
            end
        else    
            @budget = @user.budgets.create(budget_params)
            @budget.total=0.0
            if @budget.save
                redirect_to user_budgets_path
            else
                render 'new'
            end
        end
    end
    
    def show
        @user = current_user
        @budget = Budget.find(params[:id])
        @expenses = @budget.expenses
        @incomes = @budget.incomes
    end

    def index
        @user = current_user
        @budgets = @user.budgets
        # @budgets = Budget.all
    end
    
    def edit
        @user = current_user
        @budget = Budget.find(params[:id])
    end

    def update
        @user = current_user
        @budget = Budget.find(params[:id])
        
        if @budget.update(budget_params)
            redirect_to user_budgets_path(@user)
        else
            render 'edit'
        end
    end
    
    def destroy
        @user = current_user
        @budget = Budget.find(params[:id])
        @budget.destroy
        
        redirect_to user_budgets_path(@user)
    end
    
end

private
    def budget_params
        params.require(:budget).permit(:month, :target, :total)
    end
    
    def tally_budget
        @budget.total = 0.0 + @budget.incomes.sum('amount') - @budget.expenses.sum('amount')
        @budget.save
    end