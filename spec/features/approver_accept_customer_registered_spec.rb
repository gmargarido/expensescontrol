require 'rails_helper'

feature 'Approver accept a customer registered' do
  scenario 'successfully' do
    # Criação dos dados
    user = User.create(email: 'glauco.margarido@gmail.com', password: '12345678')
    customer = Customer.create!(name: 'Petrobras', cnpj: '00132072000253',
                                social_name: 'Petrobras Petroquimica S/A',
                                status: "pending", user: user)

    # Navegação
    visit root_path
    fill_in 'Email', with: 'glauco.margarido@gmail.com'
    fill_in 'Senha', with: '12345678'
    click_on 'Log in'
    click_on 'Clientes'
    click_on 'Petrobras'
    click_on 'Aprovar'

    # Expectativa
    expect(page).to have_css('h3', text: 'Petrobras')
    expect(page).to have_css('p', text: 'Razão Social: Petrobras Petroquimica S/A')
    expect(page).to have_css('p', text: 'CNPJ: 00132072000253')
    expect(page).to have_css('p', text: 'Cadastrado por: glauco.margarido@gmail.com')
    expect(page).to have_css('p', text: 'Status: active')
  end
end
