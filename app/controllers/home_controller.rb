class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    if current_user.approver?
      @expense_reports = ExpenseReport.submitted
    elsif current_user.salesman?
      @expense_reports = current_user.expense_reports.all
    end
  end
end
