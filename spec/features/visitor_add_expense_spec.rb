require 'rails_helper'

feature 'Visitor add a expense' do
  scenario 'successfully' do
    # Criação dos dados
    expense_report = ExpenseReport.create(title: 'Despesas de Abril',
                                          start_date: '01/04/2018',
                                          end_date: '30/04/2018',
                                          own_car: false)

    # Navegação
    visit root_path
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
    expense_report = ExpenseReport.create(title: 'Despesas de Abril',
                                          start_date: '01/04/2018',
                                          end_date: '30/04/2018',
                                          own_car: false)
    # Navegação
    visit root_path
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
