class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @expense_reports = current_user.expense_reports.all
  end
end
