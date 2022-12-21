module ExpensesHelper
  def create_expense(expense, category_ids)
    categories = []
    category_ids.each_with_index do |category_id, idx|
      categories << category_id unless idx.zero?
    end

    expense.transaction do
      categories.each do |category_id|
        @category = Category.find(category_id)
        ExpenseCategory.save_category(@category, expense)
      end
    end
  end

  def category_expenses(category_id)
    @expense_categories = ExpenseCategory.includes(:expense).where(category_id: category_id).order(created_at: :desc)
    @expense_categories.map(&:expense)
  end

  def total_category_expense(category_id)
    category_expenses(category_id).pluck(:amount).reduce(:+)
  end
end
