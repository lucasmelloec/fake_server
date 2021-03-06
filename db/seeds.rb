# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
domain = Domain.create!({ name: 'TestDomain', path: 'test' })
expectation = Expectation.create!({ path: '/v1/blabla', method: 'GET', domain: })
Response.create!({ format: 'json', body: { hello: 'world' }.to_json, code: 200, expectation: })
