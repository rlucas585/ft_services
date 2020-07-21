#!/bin/bash
docker build --tag ft_nginx:1.0 srcs/nginx/
docker run --publish 80:80 --publish 443:443 -it --name ft_nginx ft_nginx:1.0
# docker run --publish 80:80 --publish 443:443 --detach --name ft_nginx ft_nginx:1.0
