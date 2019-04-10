class IncomesController < ApplicationController
  def new 
        @income = Income.new
  end
    
    def create
        @income = Income.new(income_params)
        
        
        if @income.save
    
            redirect_to :action => 'list'
        else
            render :action => 'new'
        end
    end
    
    def edit
        @income =  Income.find(params[:id])
    end
    
    def update
        @income = Income.find(params[:id])
        
        if @income.update_attributes(income_param)
            redirect_to :action => 'show', :id => @income
        else
        render :action => 'edit'
        end
    end
    
    def destroy
        Income.find(params[:id]).destroy
        redirect_to :action => 'list'
    end
    
    def show
        @income = Income.find(params[:id])
    end
    
    def list
        @income = Income.all
    end
    
    def show_reocurring
        @reocurring = Income.find(params[:id])
    end
    
    def show_stable
        @stable = Income.find(params[:id])
    end
    
    private
    def income_params
        params.require(:income).permit(:names, :target, :amount, :reocurring, :stable)
    end
end
