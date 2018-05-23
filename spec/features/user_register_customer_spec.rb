require 'rails_helper'

feature 'User register a customer' do
  scenario 'successfully' do
    # Criação dos dados
    user = User.create(email: 'glauco.margarido@gmail.com', password: '12345678')

    # Navegação
    visit root_path
    fill_in 'Email', with: 'glauco.margarido@gmail.com'
    fill_in 'Senha', with: '12345678'
    click_on 'Log in'
    click_on 'Cadastrar um cliente'
    fill_in 'Nome', with: 'Raizen'
    fill_in 'Razão Social', with: 'Raizen Combustiveis S/A'
    fill_in 'CNPJ', with: '01234567000189'
    click_on 'Cadastrar'


    # Expectativa
    expect(page).to have_css('h3', text: 'Raizen')
    expect(page).to have_css('p', text: 'Razão Social: Raizen')
    expect(page).to have_css('p', text: 'CNPJ: 01234567000189')
    expect(page).to have_css('p', text: 'Cadastrado por: glauco.margarido@gmail.com')
  end

  scenario 'must fill all mandatory fields' do
    # Criação dos dados
    user = User.create(email: 'glauco.margarido@gmail.com', password: '12345678')

    # Navegação
    visit root_path
    fill_in 'Email', with: 'glauco.margarido@gmail.com'
    fill_in 'Senha', with: '12345678'
    click_on 'Log in'
    click_on 'Cadastrar um cliente'
    fill_in 'Nome', with: ''
    fill_in 'Razão Social', with: ''
    fill_in 'CNPJ', with: ''
    click_on 'Cadastrar'

    # Expectativa
    expect(page).to have_content('Não foi possível cadastrar este cliente')
  end
end
