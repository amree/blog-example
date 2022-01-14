# README

```bash
# chromedriver on the host (install using brew/download manually)
chromedriver --whitelisted-ips

# build the image
docker build -t blog_example .

# install gems
docker compose run --rm chrome bundle

# setup DB
docker compose run --rm chrome rails db:create

# run the test
docker compose run --rm chrome bundle exec rspec spec/features/user_creates_post_spec.rb
```
