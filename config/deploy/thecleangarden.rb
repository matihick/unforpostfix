role :web, "thecleangarden"
role :app, "thecleangarden"
role :db,  "thecleangarden", primary: true

set :nginx_server_names, "mail.thecleangarden.com.ar"
set :brand_description, "Servidor de correo - mail.thecleangarden.com.ar"
