class StocksController < ApplicationController

    def search
        if params[:stock].present?
            @stock = Stock.new_from_lookup(params[:stock])
            if @stock
                respond_to do |format|
                    format.js { render partial: 'users/result' }
                end
            else 
                flash[:danger] = "You have entered an incorrect stock ticker"
                redirect_to my_portfolio_path
            end 
        else 
            flash[:danger] = "You have not entered a stock ticker. Please enter one"
            redirect_to my_portfolio_path
        end 
    end
end
