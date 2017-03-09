# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
UnidadeFederativa.create(sigla: 'RS', descricao: 'Rio Grande do Sul')
UnidadeFederativa.create(sigla: 'SC', descricao: 'Santa Catarina')
UnidadeFederativa.create(sigla: 'PR', descricao: 'Paraná')
Municipio.create(nome: 'Erechim')
