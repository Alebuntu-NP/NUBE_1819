

#---------------------------------------------------------------------
# Definimos para Varnish un backend HTTP (apache en 127.0.0.1:81)
#---------------------------------------------------------------------
vcl 4.0;

import directors;
backend n1 {
    .host = "192.168.1.2";
    .probe = {
     .url = "/";
     .timeout = 1s;
     .interval = 5s;
     .window = 5;
     .threshold = 3;
  }

}

backend n2 {
    .host = "192.168.1.3";
    .probe = {
      .url = "/";
      .timeout = 1s;
      .interval = 5s;
      .window = 5;
      .threshold = 3;
  }
}

backend n3 {
    .host = "192.168.1.4";
    .probe = {
      .url = "/";
      .timeout = 1s;
      .interval = 5s;
      .window = 5;
      .threshold = 3;
  }
}



sub vcl_init {
    new bar = directors.round_robin();
    bar.add_backend(n1);
    bar.add_backend(n2);
    bar.add_backend(n3);
}
#---------------------------------------------------------------------
# Una ACL para identificar a los desarrolladores web (sin cacheo)
#---------------------------------------------------------------------

#---------------------------------------------------------------------
# vcl_recv()
#
# Esta funcion sera llamada cada vez que llegue una peticion HTTP
# En ella normalmente devolveremos pass, lookup o pipe.
#
# Trabajaremos en ella con el objeto req (request), que tiene varios
# atributos tanto de lectura como de escritura.
#---------------------------------------------------------------------
sub vcl_recv 
{


    # Especificamos el backend por defecto para esta peticion:
    set req.backend_hint = bar.backend();

        
    # Eliminamos de la peticion HTTP el requerimiento del cliente
    # de usar gzip / deflate / etc (varnish 2.x no lo soporta).
    unset req.http.Accept-Encoding;
 
    # Si la URL de la peticion contiene la regexp ^/images/, tratar
    # de devolverla desde la cache de varnish:
    if (req.url ~ "^/images/") 
    {
        # Eliminamos primero las cookies que nos pueda mandar el cliente
        unset req.http.cookie;
        return(hash);
    }

 
    # Si hemos llegado aqui, es que la peticion no es de ^/images/, 
    # asi que la pasamos directamente del backend sin cachear
    return(pass);
}



 
#---------------------------------------------------------------------
# vcl_fetch()
#
# Esta funcion sera llamada cada vez que se recoge la salida de una
# peticion HTTP desde el backend HTTP.
#
# Trabajaremos en ella con el objeto beresp (backend response), que
# tiene varios atributos tanto de lectura como de escritura.
#
# En ella devolveremos normalmente pass o deliver.
#---------------------------------------------------------------------
sub vcl_backend_response
{
    
    if (bereq.url ~ "^/images/") 
    {
        # Eliminamos las cookies que pueda devolver el backend HTTP
        unset beresp.http.Set-Cookie;
 
        # Indicamos que se cachee durante 7 dias:
        set beresp.ttl = 7d;
        
        return(deliver);
    }

    # Al no indicar aqui ningun return, en las peticiones que no matchean
    # con ^/images/ se continuara con la ejecución de la funcion
    # vcl_fetch() por defecto de varnish.
}




sub vcl_deliver {
    # Happens when we have all the pieces we need, and are about to send the
    # response to the client.
    #
    # You can do accounting or modifying the final object here.
}


