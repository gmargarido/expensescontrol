require 'rails_helper'

feature 'User create a expense type' do
  scenario 'sucessfully' do
    # Criação dos dados
    user = User.create(email: 'glauco.margarido@gmail.com', password: '12345678')

    # Navegação
    visit root_path
    fill_in 'Email', with: 'glauco.margarido@gmail.com'
    fill_in 'Senha', with: '12345678'
    click_on 'Log in'
    click_on 'Cadastrar Tipo de Despesa'
    fill_in 'Descrição', with: 'Almoço'
    fill_in 'Conta Contábil', with: '632.250'
    click_on 'Cadastrar'

    # Expectativa
    expect(page).to have_css('h5', text: 'Almoço')
    expect(page).to have_css('li', text: '632.250')
  end
end