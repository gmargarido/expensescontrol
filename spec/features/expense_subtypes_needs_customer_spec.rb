require 'rails_helper'

feature 'Administrator define if a expense subtype needs a customer' do
  scenario 'successfully' do
    # Criação dos dados
    user = User.create(email: 'glauco.margarido@gmail.com', password: '12345678')
    expense_type = ExpenseType.create(description: 'Despesa com Hospedagem')

    # Navegação
    visit root_path
    fill_in 'Email', with: 'glauco.margarido@gmail.com'
    fill_in 'Senha', with: '12345678'
    click_on 'Log in'
    click_on 'Cadastrar Subtipo de Despesa'
    fill_in 'Descrição', with: 'Almoço'
    fill_in 'Conta Contábil', with: '632.250'
    select 'Sim', from: 'Precisa de um cliente?'
    click_on 'Cadastrar'

    # Expectativa
    expect(page).to have_css('h5', text: 'Almoço')
    expect(page).to have_css('p', text: 'Conta Contábil: 632.250')
    expect(page).to have_css('p', text: 'Tipo: Despesa com Hospedagem')
    expect(page).to have_css('p', text: 'Precisa de um cliente? Sim')
  end
end
