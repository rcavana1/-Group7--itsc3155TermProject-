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
        
        if @income.update_attributes(income_param)
            redirect_to @income
        else
            render 'edit'
        end
    end
    
    def destroy
        @income = Income.find(params[:id])
        @income.destroy
        
        redirect_to income_path
    end
    
    def show
        @income = Income.find(params[:id])
    end
    
    def show_reocurring
        @reocurring = Incpme.find(params[:id])
    end
    
    def show_stable
        @stable = Income.find(params[:id])
    end
    
  
end
  private
    def income_params
        params.require(:income).permit(:names, :target, :amount, :reocurring, :stable)
    end