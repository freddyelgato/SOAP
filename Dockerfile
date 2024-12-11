# Usa la imagen oficial de Ruby como base
FROM ruby:3.1.2

# Instalar la versión específica de Bundler (2.3.22 en tu caso)
RUN gem install bundler -v 2.3.22

# Exponer el puerto que usa Sinatra (por defecto es el 4567)
EXPOSE 4567

# Configuración para evitar instalar gems si Gemfile no ha cambiado
RUN bundle config --global frozen 1

# Crear y configurar el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar el Gemfile y Gemfile.lock dentro del contenedor
COPY Gemfile Gemfile.lock ./

# Instalar las gemas necesarias
RUN bundle install

# Copiar el resto de los archivos del proyecto dentro del contenedor
COPY . /app

# Comando por defecto para ejecutar el servidor Sinatra
CMD ["ruby", "server.rb"]
