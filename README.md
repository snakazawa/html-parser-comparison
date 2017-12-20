# HTML Parser Comparable

## Benchmark

This benchmark is measured by the following steps (see test codes):

1. Load first HTML file.
2. Find first 'h1' tag.
3. Load next HTML file.
4. Find first 'h1' tag.
5. If target HTML files are remained, go to step 3, otherwise end the measurement.

Target HTML files are **8212** files of articles in [Qiita Advent Calendar 2017](https://qiita.com/advent-calendar/2017).  
The measurement is performed **10** times, and the average score is set as the result score.

| language (or platform) |       name       | file/sec | errors |        parser         |   support query    | can parse `<option>' tag? | note                                   |
| :--------------------: | :--------------: | :------: | :----: | :-------------------: | :----------------: | :-----------------------: | :------------------------------------- |
|          Ruby          |     Nokogiri     |    ?     |   ?    |      libxml2 (C)      |     XPath, CSS     |            yes            |                                        |
|          Ruby          |       Oga        |    ?     |   ?    | ast, ruby-ll (native) |     XPath, CSS     |            yes            |                                        |
|         Python         |  BeautifulSoup4  |    ?     |   ?    | html.parser (native)  | CSS, find function |            yes            |                                        |
|         Python         |  BeautifulSoup4  |    ?     |   ?    |       lxml (C)        | CSS, find function |            yes            |                                        |
|         Python         |  BeautifulSoup4  |    ?     |   ?    |   html5lib (native)   | CSS, find function |            yes            |                                        |
|        Node.js         |     cheerio      |    ?     |   ?    | htmlparser2 (native)  |         ?          |             ?             |                                        |
|        Node.js         |     libxmljs     |    ?     |   ?    |      libxml (C)       |         ?          |             ?             |                                        |
|        Node.js         |      jsdom       |    ?     |   ?    |    parse5 (native)    |         ?          |             ?             |                                        |
|        Node.js         |    dom-parser    |    ?     |   ?    |       (native)        |  old DOM function  |             ?             | the content is not parsed at load time |
|        Node.js         | fast-html-parser |    ?     |   ?    |       (native)        |         ?          |             ?             |                                        |
|          C++           |   gumbo-query    |    ?     |   ?    |   gumbo-parser (C)    |        CSS         |             ?             |                                        |


`file/sec` column indicates 8212 divided by several total parsing seconds.  
`can parse '<option>' tag?` column means whether several parser can parse such following HTML text.

```html
<select>
  <option value="a">A
  <option value="b">B
  <option value="c">C
</select>
```

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
