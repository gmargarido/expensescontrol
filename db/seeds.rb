# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

approver = User.create(email: 'adm@bray.com', password: '12345678',
                      profile: "approver")
user = User.create(email: 'glauco.margarido@gmail.com', password: '12345678',
                      profile: "salesman")

customer = Customer.create!(name: 'Petrobras', cnpj: '00132072000253',
                            social_name: 'Petrobras Petroquimica S/A',
                            status: "pending", user: user)

expense_type = ExpenseType.create!(description: 'Despesa com Hospedagem')

expense_subtype = ExpenseSubtype.create!(description: 'Almoço',
                        accounting_account: '632.250',
                        expense_type_id: expense_type.id)

expense_report = ExpenseReport.create!(title: 'Despesas de Abril',
                                      start_date: '01/04/2018',
                                      end_date: '30/04/2018',
                                      own_car: false,
                                      user: user,
                                      status: "saved")

expense = Expense.create!(value: 150, expense_report: expense_report,
                        expense_subtype: expense_subtype,
                        customer: customer)

expense_2 = Expense.create!(value: 350, expense_report: expense_report,
                        expense_subtype: expense_subtype)
