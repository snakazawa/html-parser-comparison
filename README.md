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
