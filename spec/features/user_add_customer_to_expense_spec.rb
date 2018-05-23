require 'rails_helper'

feature 'User add a customer to expense' do
  scenario 'successfully' do
    # Criação dos dados
    user = User.create(email: 'glauco.margarido@gmail.com', password: '12345678')
    expense_type = ExpenseType.create(description: 'Despesa com Hospedagem')
    customer = Customer.create(name: 'Petrobras', social_name: 'Petrobras SA',
                              cnpj: '12345678000199', user: user)
    expense_report = ExpenseReport.create(title: 'Despesas de Abril',
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
    fill_in 'Valor', with: '300'
    select 'Petrobras', from: 'Cliente'
    click_on 'Salvar'

    # Expectativa
    expect(page).to have_css('h6', text: 'Almoço')
    expect(page).to have_css('li', text: 'Cliente: Petrobras')
    expect(page).to have_css('li', text: 'Valor: R$ 300.0')
  end
end
