class ExpenseSubtypesController < ApplicationController
  def new
    @expense_subtype = ExpenseSubtype.new
    @expense_types = ExpenseType.all
  end

  def create
    @expense_types = ExpenseType.all

    expense_subtype_params = params.require(:expense_subtype).permit(
                                                :description, :accounting_account,
                                                :expense_type_id)

    @expense_subtype = ExpenseSubtype.create(expense_subtype_params)

    if @expense_subtype.save
      redirect_to @expense_subtype
    else
      flash[:error] = 'Não foi possível criar cadastrar.'
      render :new
    end
  end

  def show
    @expense_subtype = ExpenseSubtype.find(params[:id])
  end
end
