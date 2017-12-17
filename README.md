# Compare HTML Parser

## Crawl

```
cd data
./crawl_calendars.sh | tee calendars.txt | grep -ve '^page ' | ./crawl_articles.sh | tee articles.txt | crawl_pages.sh

# check
./crawl_pages.sh

# ignore not utf-8 page
./ignore_page.sh
```

## Parse by Ruby

```
cd ruby
bundle install --path vendor/bundle

# use Nokogiri
bundle exec ruby nokogiri.rb

# use Oga
bundle exec ruby oga.rb
```

## Parse by Python

**TODO**

## Parse by C++

**TODO**
