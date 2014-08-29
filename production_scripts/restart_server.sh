ps aux | grep 'unicorn' | awk '{print $2}' | xargs sudo kill -9
sudo service nginx restart

cd ~/workspace/staging/Smartboard/ && unicorn_rails -c config/unicorn.rb -E staging -D
cd ~/workspace/production/Smartboard/ && unicorn_rails -c config/unicorn.rb -E production -D
