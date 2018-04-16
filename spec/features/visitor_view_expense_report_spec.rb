require 'rails_helper'

feature 'Visitor view a expense report' do
  scenario 'successfully' do
    # Criação dos dados
    expense_report = ExpenseReport.create(title: 'Despesas de Abril',
                                          start_date: '01/04/2018',
                                          end_date: '30/04/2018',
                                          own_car: false)
    # Navegação
    visit root_path

    # Expectativa
    expect(page).to have_css('h3', text: 'Relatórios de Despesas')
    expect(page).to have_css('a', text: 'Despesas de Abril')
  end

  scenario 'created by him' do
    # Criação dos dados
    # Navegação
    visit root_path
    click_on 'Cadastrar um relatório de despesas'
    fill_in 'Descrição', with: 'Despesas de Maio'
    fill_in 'Data inicial', with: '01/05/2018'
    fill_in 'Data final', with: '31/05/2018'
    choose('Não')
    click_on 'Cadastrar'

    #Expectativa
    expect(page).to have_css('h3', text: 'Relatórios de Despesas')
    expect(page).to have_css('a', text: 'Despesas de Maio')

  end
end
