require 'rails_helper'

feature 'Visitor create a report and add to it a expense' do
  scenario 'successfully' do
    # Criação dos dados
    expense_report = ExpenseReport.create(title: 'Despesas de Abril',
                                          start_date: '01/04/2018',
                                          end_date: '30/04/2018',
                                          own_car: false)

    # Navegação
    visit root_path
    click_on 'Despesas de Abril'
    click_on 'Cadastrar uma despesa'
    fill_in 'Descrição', with: 'Almoço'
    fill_in 'Valor', with: '25.9'
    fill_in 'Centro de Custo', with: 'São Paulo'
    click_on 'Salvar'

    # Expectativa
    expect(page).to have_css('h3', text: 'Despesas de Abril')
    expect(page).to have_css('li', text: 'Almoço')
  end
end
