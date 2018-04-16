require 'rails_helper'

feature 'Visitor view a expense in home' do
  scenario 'successfully' do
    # Criação dos dados
    expense = Expense.create(title: 'Combustivel', value: 150, cost_center: 'São Paulo')

    # Navegação
    visit root_path

    # Expectativa
    expect(page).to have_css('h3', text: 'Despesas')
    expect(page).to have_css('li', text: 'Combustivel')
    expect(page).to have_css('li', text: '150')
    expect(page).to have_css('li', text: 'São Paulo')
  end
end
