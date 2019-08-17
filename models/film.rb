require_relative('../db/sql_runner')
require_relative('./customer')

class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price = options['price'].to_i
  end

  def save
    sql = "INSERT INTO films (title, price)
          VALUES ($1, $2) RETURNING id"
    values = [@title, @price]
    film = SqlRunner.run(sql, values)[0]
    @id = film['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM films"
    data = SqlRunner.run(sql)
    return data.map { |film| self.new(film)}
  end

  def update
    sql = "UPDATE films SET (title, price) = ($1, $2) WHERE id = $3"
    values = [@title, @price, @id]
    SqlRunner.run(sql,values)
  end

  def delete
    sql = "DELETE FROM films WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.map_items(data)
    result = data.map{|film| Film.new(film)}
    return result
  end

  # def customers
  #   sql = "SELECT customers.* FROM customers INNER JOIN tickets ON customers.id = tickets.customer_id WHERE customer_id = $1
  #   INNER JOIN screenings ON films.id = screenings.film_id WHERE film_id = $2"
  #   values = [customers.id, @id]
  #   customer_data = SqlRunner.run(sql, values)
  #   return Customer.map_items(customer_data)
  # end

  def customers_count
    customers.count
  end

  def price
    sql = "SELECT price FROM films WHERE id = $1"
    values = [@id]
    price_data = SqlRunner.run(sql, values)[0]
    return price_data["price"].to_i
  end

end
