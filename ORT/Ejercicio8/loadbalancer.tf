resource "aws_lb" "alb_ej8" {
  name               = "ejercicio8"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_ssh_http_mysql.id]
  subnets            = [aws_subnet.sub_net_us-east-1a.id,aws_subnet.sub_net_us-east-1b.id]


  tags = {
    Environment = "Ejercicio8"
  }
}

resource "aws_lb_target_group" "todos_los_webapp" {
  vpc_id   = aws_vpc.vpc_ej8.id
  name     = "webapp"
  port     = 80
  protocol = "HTTP"
  target_type = "instance"
  
  health_check {
    interval            = 30
    protocol            = "HTTP"
    timeout             = 10
    healthy_threshold   = 3
    unhealthy_threshold = 3
    path                = "/var/www/html/simple-ecomme"
  } 
}

resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.alb_ej8.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.todos_los_webapp.arn
    type             = "forward"
  }
}

resource "aws_lb_target_group_attachment" "reg_inst-01" {
  target_group_arn = aws_lb_target_group.todos_los_webapp.id
  target_id        = module.webapp-server-01.identificador_instancia
  port             = 80
}

resource "aws_lb_target_group_attachment" "reg_inst-02" {
  target_group_arn = aws_lb_target_group.todos_los_webapp.id
  target_id        = module.webapp-server-02.identificador_instancia
  port             = 80
}