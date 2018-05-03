class ExpensesController < ApplicationController
  def new
    @expense_report = ExpenseReport.find(params[:expense_report_id])
    @expense =  Expense.new
  end

  def create
    @expense_report = ExpenseReport.find(params[:expense_report_id])
    @expense = @expense_report.expenses.create(expense_params)

    if @expense.save
      redirect_to @expense_report
    else
      flash[:error] = 'Não foi possível criar esta despesa'
      render :new
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:title, :value, :cost_center)
  end
end
