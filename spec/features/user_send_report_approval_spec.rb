require 'rails_helper'

feature 'User submit a report to approval' do
  scenario 'successfully' do
    # Criação dos dados
    user = User.create(email: 'glauco.margarido@gmail.com', password: '12345678',
                        profile: "salesman")
    expense_type = ExpenseType.create!(description: 'Despesa com Hospedagem')
    expense_subtype = ExpenseSubtype.create!(description: 'Almoço',
                            accounting_account: '632.250',
                            expense_type_id: expense_type.id)
    expense_report = ExpenseReport.create!(title: 'Despesas de Abril',
                                          start_date: '01/04/2018',
                                          end_date: '30/04/2018',
                                          own_car: false,
                                          user: user,
                                          status: "saved")

    customer = Customer.create!(name: 'Glauco', social_name: 'Glauco S/A',
                              cnpj: '01234567000100', user: user)

    expense = Expense.create!(value: 150, expense_report: expense_report,
                            expense_subtype: expense_subtype,
                            customer: customer)

    # Navegação
    visit root_path
    fill_in 'Email', with: 'glauco.margarido@gmail.com'
    fill_in 'Senha', with: '12345678'
    click_on 'Log in'
    click_on expense_report.title
    click_on 'Submeter à aprovação'

    # Expectativa
    expect(page).to have_css('p', text: 'Status: Aguardando aprovação')
  end
end
