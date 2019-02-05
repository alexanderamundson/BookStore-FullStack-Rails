class StoreController < ApplicationController
  def index
    @products = Product.order(:popularity).reverse_order
    if session[:counter].nil?
      session[:counter] = 0
    else
      session[:counter] += 1
      if session[:counter] > 5
        flash.now[:index]="You visited the catalog #{session[:counter]}
           times".pluralize(session[:counter])+" without buying anything!... Come on!"
        render :index  
    
    
      end
    end    
  end
end