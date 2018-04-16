class HomeController < ApplicationController
  def index
    @expenses = Expense.all
    @expense_reports = ExpenseReport.all
  end
end
