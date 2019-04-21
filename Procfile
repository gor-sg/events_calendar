web: bin/rails server -p $PORT -e $RAILS_ENV
redis: redis-server /usr/local/etc/redis.conf
worker: bin/sidekiq -C config/sidekiq.yml
