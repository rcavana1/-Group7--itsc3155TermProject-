class BudgetController < ApplicationController

    def new
    end
    
    def create
        render plain: params[:budget].inspect
    end

end