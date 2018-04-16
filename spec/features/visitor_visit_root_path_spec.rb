require 'rails_helper'

feature 'Visitor visit index' do
  scenario 'successfully' do
    visit root_path

    expect(page).to have_css('h1', text: "Bem-vindo ao Controle de Despesas")
  end
end
