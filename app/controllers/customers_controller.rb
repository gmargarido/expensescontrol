class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.create(customer_params)
    @customer.user = current_user

    if @customer.save
      redirect_to @customer
    else
      flash[:error] = 'Não foi possível criar este cliente'
      render :new
    end
  end

  def show
    @customer = Customer.find(params[:id])
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :social_name, :cnpj)
  end
end
