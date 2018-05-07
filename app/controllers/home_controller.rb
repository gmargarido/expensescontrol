class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @expenses = Expense.all
    @expense_reports = ExpenseReport.all
  end
end
