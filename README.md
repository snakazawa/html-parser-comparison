# Compare HTML Parser

## Crawl

```
cd data
./crawl_calendars.sh | tee calendars.txt | grep -ve '^page ' | ./crawl_articles.sh | tee articles.txt | ./crawl_pages.sh

# check
./crawl_pages.sh
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

```
cd python
pip install -r requirements.txt

# use BeautifulSoup4 with html.parser
python beautifulsoup4_html_parser.py

# use BeautifulSoup4 with lxml
python beautifulsoup4_lxml.py

# use BeautifulSoup4 with html5lib
python beautifulsoup4_html5lib.py
```

## Parse by C++

**TODO**
