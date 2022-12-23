class ExpensesController < ApplicationController
  load_and_authorize_resource
  include ExpensesHelper

  def index
    @category = Category.where(params[:category_id])
    @expenses = category_expenses(params[:category_id])
    @total_category_expense = total_category_expense(params[:category_id])
  end

  def show
    @expense = Expense.find(params[:id])
  end

  def new
    @expense = Expense.new
    @categories = Category.where(author: current_user)
  end

  def create
    @expense = Expense.new(expense_params)
    @prev_category = Category.where(params[:expense][:prev_category_id])
    create_expense(@expense, params[:category][:category_id])

    if @expense.save
      redirect_to category_expenses_path(@prev_category), notice: 'Added expense successfully!'
    else
      redirect_to new_expense_path(prev_category_id: @prev_category.id), alert: 'Expense was not added!'
    end
  end

  def destroy; end

  def expense_params
    expense_hash = params.require(:expense).permit(:name, :amount)
    expense_hash[:author] = current_user
    expense_hash
  end
end
