class AccountsController < ApplicationController
    def login
    end
    
    def new
        @account = Account.new
    end
    
    def create
        @account = Account.new(account_params)
        
        if @account.save
            redirect_to @account
        else
            render 'new'
        end
    end
    
    def edit
    end
    
    def destroy
    end
    
    def show
        @account = Account.find(params[:id])
    end
end

private
    def account_params
        params.require(:account).permit(:username, :password, :name)
    end