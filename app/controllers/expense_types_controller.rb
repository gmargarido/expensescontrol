class ExpenseTypesController < ApplicationController
  def new
    @expense_type = ExpenseType.new
  end

  def create
    expense_type_params = params.require(:expense_type).permit(:description,
                                                            :accounting_account)

    @expense_type = ExpenseType.create(expense_type_params)

    if @expense_type.save
      redirect_to @expense_type
    else
      flash[:error] = 'Não foi possível cadastrar.'
      render :new
    end
  end

  def show
    @expense_type = ExpenseType.find(params[:id])
  end
end
