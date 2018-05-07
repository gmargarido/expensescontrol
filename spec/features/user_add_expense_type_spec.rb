require 'rails_helper'

feature 'User add a expense type to a expense' do
  scenario 'sucessfully' do
    # Criação dos dados
    user = User.create(email: 'glauco.margarido@gmail.com', password: '12345678')
    expense_report = ExpenseReport.create(title: 'Despesas de Abril',
                                          start_date: '01/04/2018',
                                          end_date: '30/04/2018',
                                          own_car: false,
                                          user: user)

    expense_type = ExpenseType.create(description: 'Almoço', accounting_account: '632.250')                                        

    expense = Expense.create(title: 'Combustivel', value: 150, cost_center: 'São Paulo', expense_report: expense_report)

    # Navegação

    # Expectativa

  end
end
