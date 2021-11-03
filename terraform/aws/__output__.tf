output "url" {
  value = "http://${module.infra.lb_dns_name}"
}