ps aux | grep 'ruby' | awk '{print $2}' | xargs sudo kill -9
cd ~/workspace/staging/Smartboard/ && RAILS_ENV=production bundle exec rackup private_pub.ru -s thin -p 3030 -E production -D
