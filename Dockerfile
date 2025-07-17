FROM php:8.1-apache

# 安裝必要套件
RUN docker-php-ext-install mysqli

# 複製 YOURLS 原始碼到 Apache 網頁根目錄
COPY . /var/www/html/

# 啟用 Apache rewrite 模組
RUN a2enmod rewrite

# 設定 Apache 權限
RUN chown -R www-data:www-data /var/www/html

# 預設啟動 Apache
CMD ["apache2-foreground"]
