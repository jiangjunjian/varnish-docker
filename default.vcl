vcl 4.0;

backend default {
    .host = "varnish-cache.org";
    .port = "80";
}

sub vcl_recv {
    set req.backend_hint = default; 
}