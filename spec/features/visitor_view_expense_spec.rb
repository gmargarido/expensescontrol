require 'rails_helper'

feature 'Visitor view a expense in home' do
  scenario 'successfully' do
    # Criação dos dados
    user = User.create(email: 'glauco.margarido@gmail.com', password: '12345678')
    expense_report = ExpenseReport.create(title: 'Despesas de Abril',
                                          start_date: '01/04/2018',
                                          end_date: '30/04/2018',
                                          own_car: false)
    expense = Expense.create(title: 'Combustivel', value: 150, cost_center: 'São Paulo', expense_report: expense_report)

    # Navegação
    visit root_path
    fill_in 'Email', with: 'glauco.margarido@gmail.com'
    fill_in 'Senha', with: '12345678'
    click_on 'Log in'
    click_on expense_report.title

    # Expectativa
    expect(page).to have_css('h3', text: 'Despesas')
    expect(page).to have_css('li', text: 'Combustivel')
    expect(page).to have_css('li', text: '150')
    expect(page).to have_css('li', text: 'São Paulo')
  end
end
