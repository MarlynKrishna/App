class ProductsController < ApplicationController
    # GET method to get all products from database   
    def index   
      @products = Product.all   
    end   
     
    # GET method to get a product by id   
    def show   
      @product = Product.find(params[:id])   
    end   
     
    # GET method for the new product form   
    def new   
      @product = Product.new   
    end   
     
    # POST method for processing form data   
    def create   
      @product = Product.new(product_params)
      if @product.save
        redirect_to "/"
        flash[:notice] = "added successfully"
      else
        render 'new'
      end
       
         
    
  end 
 
      
     
     # GET method for editing a product based on id   
    def edit   
      @product = Product.find(params[:id])   
    end   
     
    # PUT method for updating in database a product based on id   
    def update   
      @product = Product.find(params[:id])  
      @product.update(product_params)
      redirect_to "/"
     
     
    end   
     
    # DELETE method for deleting a product from database based on id   
    def destroy   
      @product = Product.find(params[:id])
      @product.destroy  
      # flash[:note] = "Delete Success" 
         redirect_to "/"
         
   
    end   
     
    # we used strong parameters for the validation of params   
    def product_params   
      params.require(:product).permit(:name, :price, :old_price, :short_description, :full_description)   
    end   
end


