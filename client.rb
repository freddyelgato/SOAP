require 'savon'

client = Savon.client(wsdl: 'http://localhost:4567/soap.wsdl')

response = client.call(:soap, message: { sayHello: 'Freddy' })

puts response.body[:say_hello_response][:message]
