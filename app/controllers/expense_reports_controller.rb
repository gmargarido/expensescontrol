class ExpenseReportsController < ApplicationController
  def show
    @expense_report = ExpenseReport.find(params[:id])
    @comment = Comment.new
  end

  def new
    @expense_report = ExpenseReport.new
  end

  def create
    report_params = params.require(:expense_report).permit(:title, :start_date,
                                  :end_date, :own_car)

    @expense_report = ExpenseReport.create(report_params)
    @expense_report.user = current_user

    if @expense_report.save
      redirect_to expense_report_path(@expense_report)
    else
      flash[:error] = 'Não foi possível criar este relatório.'
      render :new
    end
  end

  def submit
    @expense_report = ExpenseReport.find(params[:expense_report_id])
    @expense_report.submitted!
    redirect_to @expense_report
  end
end
