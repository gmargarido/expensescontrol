require 'rails_helper'

feature 'User create a report and add to it a expense' do
  scenario 'successfully' do
    # Criação dos dados
    user = User.create!(email: 'glauco.margarido@gmail.com', password: '12345678')
    customer = Customer.create(name: 'Petrobras', cnpj: '12345678000199',
                                social_name: 'Petrobras S/A', user: user)
    expense_type = ExpenseType.create!(description: 'Despesa com Hospedagem')

    expense_subtype = ExpenseSubtype.create!(description: 'Almoço',
                                    accounting_account: '632.250',
                                    expense_type_id: expense_type.id)

    # Navegação
    visit root_path
    fill_in 'Email', with: 'glauco.margarido@gmail.com'
    fill_in 'Senha', with: '12345678'
    click_on 'Log in'
    click_on 'Cadastrar um relatório de despesas'
    fill_in 'Descrição', with: 'Despesas de Abril'
    fill_in 'Data inicial', with: '01/04/2018'
    fill_in 'Data final', with: '30/04/2018'
    choose 'expense_report_own_car_false'
    click_on 'Cadastrar'
    click_on 'Cadastrar uma despesa'
    select 'Almoço', from: 'Classificação'
    fill_in 'Valor', with: '25.9'
    select 'Petrobras', from: 'Cliente'
    click_on 'Salvar'

    # Expectativa
    expect(page).to have_css('h3', text: 'Despesas de Abril')
    expect(page).to have_css('h6', text: 'Almoço')
    expect(page).to have_css('li', text: '25.9')
  end

  scenario 'and must all expense report fields' do
    # Criação dos dados
    user = User.create!(email: 'glauco.margarido@gmail.com', password: '12345678')

    expense_type = ExpenseType.create!(description: 'Despesa com Hospedagem')

    expense_subtype = ExpenseSubtype.create!(description: 'Almoço',
                                    accounting_account: '632.250',
                                    expense_type_id: expense_type.id)

    # Navegação
    visit root_path
    fill_in 'Email', with: 'glauco.margarido@gmail.com'
    fill_in 'Senha', with: '12345678'
    click_on 'Log in'
    click_on 'Cadastrar um relatório de despesas'
    fill_in 'Descrição', with: ''
    fill_in 'Data inicial', with: '01/04/2018'
    fill_in 'Data final', with: '30/04/2018'
    choose 'expense_report_own_car_false'
    click_on 'Cadastrar'

    # Expectativa
    expect(page).to have_content('Não foi possível criar este relatório.')
  end
end
