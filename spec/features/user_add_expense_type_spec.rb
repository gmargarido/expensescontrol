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
    click_on 'Cadastrar'

    # Expectativa
    expect(page).to have_css('h5', text: 'Almoço')
  end

  scenario 'and must fill all fields' do
    # Criação dos dados
    user = User.create(email: 'glauco.margarido@gmail.com', password: '12345678')

    # Navegação
    visit root_path
    fill_in 'Email', with: 'glauco.margarido@gmail.com'
    fill_in 'Senha', with: '12345678'
    click_on 'Log in'
    click_on 'Cadastrar Tipo de Despesa'
    fill_in 'Descrição', with: ''
    click_on 'Cadastrar'

    # Expectativa
    expect(page).to have_content('Não foi possível cadastrar.')
  end
end
