require 'rails_helper'

feature 'User add expense subtype' do
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
    select 'Despesa com Hospedagem', from: 'Tipo'
    click_on 'Cadastrar'

    # Expectativa
    expect(page).to have_css('h5', text: 'Almoço')
    expect(page).to have_css('p', text: 'Conta Contábil: 632.250')
    expect(page).to have_css('p', text: 'Tipo: Despesa com Hospedagem')
  end

  scenario 'and must fill all fields' do
    # Criação dos dados
    user = User.create(email: 'glauco.margarido@gmail.com', password: '12345678')
    expense_type = ExpenseType.create(description: 'Despesa com Hospedagem')

    # Navegação
    visit root_path
    fill_in 'Email', with: 'glauco.margarido@gmail.com'
    fill_in 'Senha', with: '12345678'
    click_on 'Log in'
    click_on 'Cadastrar Subtipo de Despesa'
    fill_in 'Descrição', with: ''
    fill_in 'Conta Contábil', with: ''
    select 'Despesa com Hospedagem', from: 'Tipo'
    click_on 'Cadastrar'

    # Expectativa
    expect(page).to have_content('Não foi possível cadastrar')
  end
end
