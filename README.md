# HTML Parser Comparison

**:warning: This is a personal investigation. :warning:**

## Benchmark

This benchmark is measured by the following steps (see also test codes):

1. Load first HTML file.
2. Find first 'h1' tag.
3. Load next HTML file.
4. Find first 'h1' tag.
5. If target HTML files are remained, go to step 3, otherwise end the measurement.

Parsed targets are **10599** HTML files of articles in [Qiita Advent Calendar 2017](https://qiita.com/advent-calendar/2017) (not utf-8 files are exceeded).  
I performed this measurement **10** times, and set the average scores as the result scores.

| language (or platform) |       name       |             parser             |       support query       | performance (file/sec) | errors | note                               |
| :--------------------: | :--------------: | :----------------------------: | :-----------------------: | :--------------------: | :----: | :--------------------------------- |
|          Ruby          |     Nokogiri     |          libxml2 (C)           |        XPath, CSS         |          245           |   0    |                                    |
|          Ruby          |       Oga        |     ast, ruby-ll (native)      |        XPath, CSS         |           66           |   31   |                                    |
|         Python         |  BeautifulSoup4  | html.parser (standard library) |    CSS, find function     |           42           |   5    |                                    |
|         Python         |  BeautifulSoup4  |            lxml (C)            |    CSS, find function     |           60           |   5    |                                    |
|         Python         |  BeautifulSoup4  |       html5lib (native)        |    CSS, find function     |           17           |   5    |                                    |
|        Node.js         |     cheerio      |      htmlparser2 (native)      | CSS, jquery like function |          125           |   0    |                                    |
|        Node.js         |     libxmljs     |           libxml (C)           |           XPath           |          383           |   0    |                                    |
|        Node.js         |      jsdom       |        parse5 (native)         |     CSS, DOM function     |           36           |   0    |                                    |
|        Node.js         |    dom-parser    |            (native)            |     old DOM function      |          1562          |   1    | the content is parsed at just time |
|        Node.js         | fast-html-parser |            (native)            |            CSS            |          1400          |   0    |                                    |
|          C++           |   gumbo-query    |        gumbo-parser (C)        |            CSS            |          459           |   0    |                                    |


## Crawling

```
cd data
./crawl_calendars.sh | tee calendars.txt | grep -ve '^page ' | ./crawl_articles.sh | tee articles.txt | ./crawl_pages.sh

# check
./check_pages.sh
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
bundle exec ruby nokogiri_test.rb
```

### Oga

```
bundle exec ruby oga_test.rb
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
python beautifulsoup4_html_parser_test.py
```

### BeautifulSoup4 (lxml)

```
python beautifulsoup4_lxml_test.py
```

### BeautifulSoup4 (html5lib)

```
python beautifulsoup4_html5lib_test.py
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
node fast_html_parser_test.js
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
g++ -std=c++1y -O2 gumbo_query_test.cpp -o gumbo_query_test.out -I/usr/local/include -L/usr/local/lib -lgumbo -lgq
./gumbo_query_test.out
```
