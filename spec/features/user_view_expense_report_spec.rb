require 'rails_helper'

feature 'User view a expense report' do
  scenario 'successfully' do
    # Criação dos dados
    user = User.create(email: 'glauco.margarido@gmail.com', password: '12345678')
    expense_report = ExpenseReport.create(title: 'Despesas de Abril',
                                          start_date: '01/04/2018',
                                          end_date: '30/04/2018',
                                          own_car: false,
                                          user: user)

    other_user = User.create(email: 'joaorsalmeida@gmail.com', password: '12345678')
    other_expense_report = ExpenseReport.create(title: 'Despesas de Maio',
                                          start_date: '01/05/2018',
                                          end_date: '30/05/2018',
                                          own_car: false,
                                          user: other_user)



    # Navegação
    visit root_path
    fill_in 'Email', with: 'glauco.margarido@gmail.com'
    fill_in 'Senha', with: '12345678'
    click_on 'Log in'

    # Expectativa
    expect(page).to have_css('h3', text: 'Relatórios de Despesas')
    expect(page).to have_css('a', text: 'Despesas de Abril')
    expect(page).not_to have_css('a', text: 'Despesas de Maio')
  end

  scenario 'created by him' do
    # Criação dos dados
    user = User.create(email: 'glauco.margarido@gmail.com', password: '12345678')

    # Navegação
    visit root_path
    fill_in 'Email', with: 'glauco.margarido@gmail.com'
    fill_in 'Senha', with: '12345678'
    click_on 'Log in'
    click_on 'Cadastrar um relatório de despesas'
    fill_in 'Descrição', with: 'Despesas de Maio'
    fill_in 'Data inicial', with: '01/05/2018'
    fill_in 'Data final', with: '31/05/2018'
    choose 'expense_report_own_car_false'
    click_on 'Cadastrar'

    #Expectativa
    expect(page).to have_css('h3', text: 'Despesas de Maio')
  end

  scenario 'and must fill all fields to add' do
    # Criação dos dados
    user = User.create(email: 'glauco.margarido@gmail.com', password: '12345678')

    # Navegação
    visit root_path
    fill_in 'Email', with: 'glauco.margarido@gmail.com'
    fill_in 'Senha', with: '12345678'
    click_on 'Log in'
    click_on 'Cadastrar um relatório de despesas'
    fill_in 'Descrição', with: ''
    fill_in 'Data inicial', with: ''
    fill_in 'Data final', with: ''
    choose 'expense_report_own_car_false'
    click_on 'Cadastrar'

    #Expectativa
    expect(page).to have_content('Não foi possível criar este relatório.')
  end
end
