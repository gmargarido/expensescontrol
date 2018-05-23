class CustomersController < ApplicationController
  def index
    @pending_customers = Customer.where(status: :pending)
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.create(customer_params)
    @customer.user = current_user

    if @customer.save
      redirect_to @customer
    else
      flash[:error] = 'Não foi possível cadastrar este cliente'
      render :new
    end
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def approve
    @customer = Customer.find(params[:customer_id])
    @customer.active!
    redirect_to @customer
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :social_name, :cnpj, :status)
  end
end
