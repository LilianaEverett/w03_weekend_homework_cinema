require_relative('./models/customer')
require_relative('./models/film')
require_relative('./models/ticket')
require_relative('./models/screening')
require('pry-byebug')

Ticket.delete_all
Customer.delete_all
Film.delete_all
Screening.delete_all

customer1 = Customer.new({
  'name' => 'Liliana Everett',
  'funds' => 1000
  })

customer2 = Customer.new({
  'name' => 'Pedro Everett',
  'funds' => 2000
  })

customer3 = Customer.new({
  'name' => 'Emília Santos',
  'funds' => 3000
  })

customer1.save()
customer2.save()
customer3.save()

film1 = Film.new({
  'title' => 'The Lord of the Rings',
  'price' => 5
  })

film2 = Film.new({
  'title' => 'Dirty Dancing',
  'price' => 5
  })

film3 = Film.new({
    'title' => 'The Perfume',
    'price' => 5
    })

film1.save()
film2.save()
film3.save()

screening1 = Screening.new({'film_id' => film1.id, 'date' => '01/08/2019', 'time' => '18:00', 'max_cap' => 50})
screening2 = Screening.new({'film_id' => film2.id, 'date' => '01/08/2019', 'time' => '20:00', 'max_cap' => 3})
screening3 = Screening.new({'film_id' => film3.id, 'date' => '01/08/2019', 'time' => '22:00', 'max_cap' => 100})

screening1.save()
screening2.save()
screening3.save()

ticket1 = Ticket.new({'customer_id' => customer1.id, 'screening_id' => screening1.id})
ticket2 = Ticket.new({'customer_id' => customer1.id, 'screening_id' => screening2.id})
ticket3 = Ticket.new({'customer_id' => customer2.id, 'screening_id' => screening2.id})
ticket4 = Ticket.new({'customer_id' => customer2.id, 'screening_id' => screening1.id})
ticket5 = Ticket.new({'customer_id' => customer3.id, 'screening_id' => screening3.id})
ticket6 = Ticket.new({'customer_id' => customer3.id, 'screening_id' => screening1.id})

ticket1.save()
ticket2.save()
ticket3.save()
ticket4.save()
ticket5.save()
ticket6.save()

film1.title = "The Two Towers"
film1.update
ticket1.customer_id = customer3.id
ticket1.update
customer2.name = "Pedro Lawrence"
customer2.update

# screening1.map_items


binding.pry
nil
