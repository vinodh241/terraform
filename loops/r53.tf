resource "aws_route53_record" "www" {
    count = 4
    zone_id = var.zone_id
    name    = "${var.instances[count.index]}.${var.domian_name}}" # {mongodb}.{vinodh.site}
    type    = "A"
    ttl     =  1
    records = [aws_instance.RoboShop[count.index].private_ip]
}