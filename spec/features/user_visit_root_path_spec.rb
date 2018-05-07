require 'rails_helper'

feature 'User visit index' do
  scenario 'successfully' do
    # Criação dos dados
    user = User.create(email: 'glauco.margarido@gmail.com', password: '12345678')

    # Navegação
    visit root_path
    fill_in 'Email', with: 'glauco.margarido@gmail.com'
    fill_in 'Senha', with: '12345678'
    click_on 'Log in'

    expect(page).to have_css('h1', text: "Bem-vindo ao Controle de Despesas")
  end
end
