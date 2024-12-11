require 'sinatra'
require 'savon'

set :bind, '0.0.0.0'

class MySoapServer < Sinatra::Base
  # Definir el WSDL para el servicio
  get '/soap.wsdl' do
    content_type 'text/xml'
    <<-WSDL
      <?xml version="1.0" encoding="UTF-8"?>
      <definitions xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"
                   xmlns:web="http://example.com/webservice"
                   targetNamespace="http://example.com/webservice">
        <message name="SayHello">
          <part name="Name" type="xsd:string"/>
        </message>
        <portType name="HelloPortType">
          <operation name="SayHello">
            <input message="web:SayHello"/>
          </operation>
        </portType>
        <binding name="HelloBinding" type="web:HelloPortType">
          <soap:binding style="rpc" transport="http://schemas.xmlsoap.org/soap/http"/>
          <operation name="SayHello">
            <soap:operation soapAction="http://example.com/webservice/SayHello"/>
            <input>
              <soap:body use="literal"/>
            </input>
          </operation>
        </binding>
        <service name="HelloService">
          <port name="HelloPort" binding="web:HelloBinding">
            <soap:address location="http://localhost:4567/soap"/>
          </port>
        </service>
      </definitions>
    WSDL
  end

  # Ruta SOAP
  post '/soap' do
    request_body = request.body.read
    if request_body.include?('<web:sayHello>')  # Aquí modificamos para que coincida con el WSDL
      content_type 'text/xml'
      <<-XML
        <soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
          <soap:Body>
            <web:sayHelloResponse>
              <message>Hello, SOAP!</message>
            </web:sayHelloResponse>
          </soap:Body>
        </soap:Envelope>
      XML
    else
      status 500
      'Invalid SOAP Request'
    end
  end
end

# Iniciar el servidor
Sinatra::Application.run!
