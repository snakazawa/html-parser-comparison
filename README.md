# Compare HTML Parser

## Benchmark

**TODO: method explanation**
**TODO: table, columns: language, name, file/sec, errors, parser, support query, can parse `<option>`?**

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
sudo apt-get install libxml2 libxml2-dev
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

## Parsing by Node.js

### Requirements
- Node.js 8.1.2

### Preparation

```
cd node
yarn install # or npm install
```

### libxmljs (libxml)

```
node libxmljs_test.js
```

### jsdom (parse5)

```
node jsdom_test.js
```

### dom-parser

**WARNING: css query and xpath are not supported**  
**WARNING: all parsing are performed with regex in just time**

```
node dom_parser_test.js
```

### fast-html-parser

```
node fast_html_parser.js
```

### cheerio (htmlparser2)

```
node cheerio_test.js
```


## Parsing by C++

## Requirements
- GCC 5.4.0

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
