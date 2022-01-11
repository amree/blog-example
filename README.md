# README

```bash
# chromedriver on the host
chromedriver --whitelisted-ips

# build the image
docker build -t blog_base --progress=plain --secret id=bundle_credentials,src=.env.development .

# run the test
docker compose run --rm web bundle exec rspec spec/features/user_creates_post_spec.rb
```
