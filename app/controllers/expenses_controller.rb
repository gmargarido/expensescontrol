class ExpensesController < ApplicationController
  def new
    @expense = Expense.new
  end

  def create
    expense_params = params.require(:expense).permit(:title, :value, :cost_center)

    @expense = Expense.create(expense_params)

    if @expense.save
      redirect_to root_path
    else
      flash[:error] = "Não foi possível criar esta despesa"
      render :new
    end
  end
end
