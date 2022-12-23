module CategoriesHelper
  def category_expense(categories)
    expenses_by_category = []
    categories.each do |category|
      total_category_expense = 0
      expense_categories = ExpenseCategory.where(category_id: category.id)
      expense_categories.each do |expense_category|
        expense = Expense.find(expense_category.expense_id)
        total_category_expense += expense.amount
      end
      expenses_by_category[category.id] = {
        category_id: category.id,
        total_expense: total_category_expense
      }
    end
    expenses_by_category
  end
end
