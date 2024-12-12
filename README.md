# SOAP Service

This project is a simple SOAP service implemented in Ruby and Docker. SOAP (Simple Object Access Protocol) is a protocol for exchanging structured information in the implementation of web services.

## Features

- **SOAP Communication**: Enables interaction using the SOAP protocol for structured messaging.
- **Dockerized Deployment**: Easily run the application in a containerized environment for scalability and portability.
- **Ease of Integration**: Simple setup with minimal configuration.
- **Reliable Messaging**: Supports structured and protocol-compliant communication.

## Requirements

- **Docker**: [Install Docker](https://www.docker.com/get-started) if you don’t have it yet.
- **Ruby**: [Install Ruby](https://www.ruby-lang.org/en/downloads/) if you want to run the application locally.

## Installation Instructions

### Clone the Repository

1. Open a terminal and clone the repository:

   ```bash
   git clone https://github.com/freddyelgato/SOAP.git
   cd SOAP
   ```

### Running Locally

2. Create a `Gemfile` in the repository directory.

3. Install the required dependencies using `bundle install`:

   ```bash
   bundle install
   ```

4. Install the `savon` gem:

   ```bash
   gem install savon
   ```

5. Start the SOAP service:

   ```bash
   ruby app.rb
   ```

### Running with Docker

6. Build and run the application using Docker:

   ```bash
   docker build -t soap-ruby-app .
   docker run -p 4567:4567 soap-ruby-app
   ```

7. Alternatively, pull the pre-built image from Docker Hub:

   ```bash
   docker pull 2424833f/soap-service
   docker run -p 4567:4567 2424833f/soap-service
   ```

8. If you encounter version-related errors, execute the following:

   ```bash
   bundle lock --add-platform x86_64-linux
   ```

9. Rebuild the Docker image and run it again:

   ```bash
   docker build -t soap-ruby-app .
   docker run -p 4567:4567 soap-ruby-app
   ```

## How it Works

- **SOAP Protocol**: The service supports communication via the SOAP protocol, allowing structured data exchanges.
- **Web Service Endpoint**: Designed to handle SOAP requests and responses.
- **Event-Driven Architecture**: Processes SOAP messages based on defined operations and actions.

## Example Usage

1. Send a SOAP request using a tool like `curl`:

   ```bash
   curl -X POST -H "Content-Type: text/xml" -d @request.xml http://localhost:4567
   ```

2. Example SOAP Request (`request.xml`):

   ```xml
   <soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope">
       <soap:Body>
           <ExampleRequest xmlns="http://example.com/">
               <Message>Hello, SOAP!</Message>
           </ExampleRequest>
       </soap:Body>
   </soap:Envelope>
   ```

3. Example SOAP Response:

   ```xml
   <soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope">
       <soap:Body>
           <ExampleResponse xmlns="http://example.com/">
               <Message>Response Received!</Message>
           </ExampleResponse>
       </soap:Body>
   </soap:Envelope>
   ```

## Screenshots

### Example 1: SOAP Service Running in Postman
![SOAP Service Running in Postman](https://i.postimg.cc/Gt2nchBN/Postman1.png)

### Example 2: SOAP Request in Postman
![SOAP Request in Postman](https://i.postimg.cc/KjHS4SBY/Postman2.png)

### Example 3: SOAP Response in Browser
![SOAP Response in Browser](https://i.postimg.cc/66jNMRgN/HELLO-WORLD.png)


## License

This project is licensed under the MIT License. See the LICENSE file for details.
