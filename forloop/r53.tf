resource "aws_route53_record" "www" {
    for_each = aws_instance.RoboShop
    zone_id = var.zone_id
    name    = "${each.key}.${var.domian_name}}" # {mongodb}.{vinodh.site}
    type    = "A"
    ttl     =  1
    records = [each.value.private_ip]
}