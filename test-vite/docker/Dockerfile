#FROM nginx:latest

# 定義基礎環境
FROM nginx:trixie-perl

# 設定非交互模式
ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /var/www/html

# 複製專案下的文件到 /var/www/html
COPY dist .

# 使用apt-get下載套件
RUN apt-get update && apt-get install -y \
  vim \
  curl

# 安裝 Node.js 24
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash\
  && . "$HOME/.nvm/nvm.sh"\
  && nvm install 24

# 複製 nginx.conf
COPY ./docker/nginx.conf /etc/nginx/conf.d/default.conf

# PORT
EXPOSE 8080

COPY ./docker/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]