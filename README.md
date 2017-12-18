# Compare HTML Parser

## Crawling

```
cd data
./crawl_calendars.sh | tee calendars.txt | grep -ve '^page ' | ./crawl_articles.sh | tee articles.txt | ./crawl_pages.sh

# check
./crawl_pages.sh
```

## Parsing by Ruby

### Requirements
- Ruby 2.4.3

### Preparation

```
cd ruby
bundle install --path vendor/bundle
```

### Nokogiri (libxml2)

```
bundle exec ruby nokogiri.rb
```

### Oga

```
bundle exec ruby oga.rb
```

## Parsing by Python

### Requirements
- Python 3.6.0

### Preparation

```
cd python
pip install -r requirements.txt

```

### BeautifulSoup4 (html.parser)

```
python beautifulsoup4_html_parser.py

```

### BeautifulSoup4 (lxml)

```
python beautifulsoup4_lxml.py
```

### BeautifulSoup4 (html5lib)

```
python beautifulsoup4_html5lib.py
```

## Parsing by C++

### gumbo-query

```
# install gumbo-parser
cd ~
git@github.com:google/gumbo-parser.git
cd gumbo-parser
./autogen.sh
./configure
make
sudo make install
sudo /sbin/ldconfig

# install gumbo-query
cd ~
git clone git@github.com:lazytiger/gumbo-query.git
cd gumbo-query/build
cmake ..
make
sudo make install
sudo /sbin/ldconfig

# test
cd compare_html_parser/cxx
g++ -std=c++1y -O2 gumbo_test.cpp -o gumbo_test.out -I/usr/local/include -L/usr/local/lib -lgumbo -lgq
./gumbo_test
```

## Parsing by Node.js

**TODO**