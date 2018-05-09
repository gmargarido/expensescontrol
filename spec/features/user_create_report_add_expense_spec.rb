require 'rails_helper'

feature 'User create a report and add to it a expense' do
  scenario 'successfully' do
    # Criação dos dados
    user = User.create!(email: 'glauco.margarido@gmail.com', password: '12345678')
    expense_report = ExpenseReport.create!(title: 'Despesas de Abril',
                                          start_date: '01/04/2018',
                                          end_date: '30/04/2018',
                                          own_car: false,
                                          user: user)

    expense_type = ExpenseType.create!(description: 'Despesa com Hospedagem')

    expense_subtype = ExpenseSubtype.create!(description: 'Almoço',
                                    accounting_account: '632.250',
                                    expense_type_id: expense_type.id)

    # Navegação
    visit root_path
    fill_in 'Email', with: 'glauco.margarido@gmail.com'
    fill_in 'Senha', with: '12345678'
    click_on 'Log in'
    click_on 'Despesas de Abril'
    click_on 'Cadastrar uma despesa'
    select 'Almoço', from: 'Classificação'
    fill_in 'Valor', with: '25.9'
    click_on 'Salvar'

    # Expectativa
    expect(page).to have_css('h3', text: 'Despesas de Abril')
    expect(page).to have_css('h6', text: 'Almoço')
    expect(page).to have_css('li', text: '25.9')
  end
end
