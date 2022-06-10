class CustomersController < ApplicationController
  
    def new
    
      @customer=Customer.new
  
  end
  def index
  
    @customers=Customer.all
  
  end
  def show
  
    @customer = Customer.find(params[:id])
  end
  def create
    @customer = Customer.new(customer_params)
  
    if @customer.save
      redirect_to "/"
     
    else
      render 'new'
    end
     
   
  
  end
  
  private
  
  def customer_params
  
      params.require(:customer).permit(:name, :phone_num, :date_on_buy, :state )
  
  
  
  
  end
  
end
