namespace :dev do
  task setup: :environment do
    p 'Deletando banco'
    %x(rails db:drop db:create db:migrate)

    kinds = %w(Amigo Comercial Conhecido)
    kinds.each { |c| Kind.create!( description: c) }
    p 'Tipos criados!'
  end

  task setup: :environment do
    p 'Cadastrando os tipos de contato'
    kinds = %w(Amigo Comercial Conhecido)
    kinds.each { |c| Kind.create!( description: c) }
    p 'Tipos criados!'
  end

  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    p 'Criando contatos...'
    100.times do |contact|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 90.years.ago, to: 18.years.ago),
        kind: Kind.all.sample
      )
    end
    p 'Contatos criados!'
  end

  task setup: :environment do
    p 'Cadastrando os telefones'
    Contact.all.each do |contact|
      Random.rand(5).times do |i|
        phone = Phone.create(number: Faker::PhoneNumber.cell_phone)
        contact.phones << phone
        contact.save!
      end
    end
    p 'Telefones cadastrados!'
  end

  task setup: :environment do
    p 'Cadastrando os endereços'
    Contact.all.each do |contact|
      Address.create(street: Faker::Address.street_address, city: Faker::Address.city, contact: contact)
    end
    p 'Endereços cadastrados!'
  end
end
