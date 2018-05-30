class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    @expense_report =  ExpenseReport.find(params[:expense_report_id])
    @comment.expense_report_id = @expense_report.id
    @comment.user = current_user

    if @comment.save
      redirect_to @expense_report
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:message)
  end
end
