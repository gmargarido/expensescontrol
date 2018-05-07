require 'rails_helper'

feature 'User add a expense' do
  scenario 'successfully' do
    # Criação dos dados
    user = User.create(email: 'glauco.margarido@gmail.com', password: '12345678')
    expense_report = ExpenseReport.create(title: 'Despesas de Abril',
                                          start_date: '01/04/2018',
                                          end_date: '30/04/2018',
                                          own_car: false,
                                          user: user)

    # Navegação
    visit root_path
    visit root_path
    fill_in 'Email', with: 'glauco.margarido@gmail.com'
    fill_in 'Senha', with: '12345678'
    click_on 'Log in'
    click_on expense_report.title
    click_on 'Cadastrar uma despesa'
    fill_in 'Descrição', with: 'Almoço'
    fill_in 'Valor', with: '25.9'
    fill_in 'Centro de Custo', with: 'São Paulo'
    click_on 'Salvar'

    # Expectativa
    expect(page).to have_css('h3', text: 'Despesas')
    expect(page).to have_css('li', text: 'Almoço')
    expect(page).to have_css('li', text: '25.9')
    expect(page).to have_css('li', text: 'São Paulo')
  end

  scenario 'and must fill all fields' do
    # Criação dos dados
    user = User.create(email: 'glauco.margarido@gmail.com', password: '12345678')
    expense_report = ExpenseReport.create(title: 'Despesas de Abril',
                                          start_date: '01/04/2018',
                                          end_date: '30/04/2018',
                                          own_car: false,
                                          user: user)

    # Navegação
    visit root_path
    visit root_path
    fill_in 'Email', with: 'glauco.margarido@gmail.com'
    fill_in 'Senha', with: '12345678'
    click_on 'Log in'
    click_on expense_report.title
    click_on 'Cadastrar uma despesa'
    fill_in 'Descrição', with: ''
    fill_in 'Valor', with: ''
    fill_in 'Centro de Custo', with: ''
    click_on 'Salvar'

    # Expectativa
    expect(page).to have_content('Não foi possível criar esta despesa')
  end
end
