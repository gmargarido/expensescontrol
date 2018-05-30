require 'rails_helper'

feature 'Approver add a comment to expense report' do
  scenario 'sucessfully' do
    # Criação dos dados
    user = User.create!(email: 'glauco.margarido@gmail.com', password: '12345678',
                      profile: "salesman")

    approver = User.create!(email: 'adm@bray.com', password: '01020304',
                      profile: "approver")

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

    expense_2 = Expense.create!(value: 350, expense_report: expense_report,
                            expense_subtype: expense_subtype)

    expense_report.submitted!

    # Navegação
    visit root_path
    fill_in 'Email', with: 'adm@bray.com'
    fill_in 'Senha', with: '01020304'
    click_on 'Log in'
    click_on 'Despesas de Abril'
    fill_in 'Adicionar comentário', with: 'Com quem você gastou isso?'
    click_on 'Enviar comentário'

    # Expectativa
    expect(page).to have_css('b', text: 'adm@bray.com')
    expect(page).to have_css('p', text: 'Com quem você gastou isso?')

  end
end
