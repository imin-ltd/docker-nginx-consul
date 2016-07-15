template {
  source = "/templates/nginx-consul.ctmpl"
  destination = "/etc/nginx/conf.d/nginx-consul.conf"
  command = "[ -e /var/run/nginx.pid ] && nginx -s reload || nginx"
}
