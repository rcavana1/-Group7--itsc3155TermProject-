class IncomesController < ApplicationController
    def new 
        @income = Income.new
    end
    
    def create
        @income = Income.new(income_params)
        
        
        if @income.save
    
            redirect_to @income
        else
            render 'new'
        end
    end
    
    def edit
        @income =  Income.find(params[:id])
    end
    
    def index
        @incomes = Income.all
    end
    
    def update
        @income = Income.find(params[:id])
        
        if @income.update(income_params)
            redirect_to @income
        else
            render 'edit'
        end
    end
    
    def destroy
        @income = Income.find(params[:id])
        @income.destroy
        
        redirect_to incomes_path
    end
    
    def show
        @income = Income.find(params[:id])
    end
    
  
end
  private
    def income_params
        params.require(:income).permit(:names, :target, :amount, :reocurring, :stable)
    end