class ExpensesController < ApplicationController
  def new
    @expense_report = ExpenseReport.find(params[:expense_report_id])
    @expense =  Expense.new
    @expense_subtypes = ExpenseSubtype.all
  end

  def create
    @expense_subtypes = ExpenseSubtype.all
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
    params.require(:expense).permit(:expense_subtype_id, :title, :value, :cost_center)
  end
end
