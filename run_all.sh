#!/bin/bash

# ruby
echo '### ruby ###'
cd ruby
echo '## nokogiri ##'
bundle exec ruby nokogiri_test.rb
echo '## oga ##'
bundle exec ruby oga_test.rb
cd ..

# python
echo '### python ###'
cd python
echo '## beautifulsoup4 (html_parser) ##'
python beautifulsoup4_html_parser_test.py
echo '## beautifulsoup4 (lxml) ##'
python beautifulsoup4_lxml_test.py
echo '## beautifulsoup4 (html5lib) ##'
python beautifulsoup4_html5lib_test.py
cd ..

# node.js
echo '### node.js ###'
cd node
echo '## cheerio ##'
node cheerio_test.js
echo '## libxmljs ##'
node libxmljs_test.js
echo '## jsdom ##'
node jsdom_test.js
echo '## dom_parser ##'
node dom_parser_test.js
echo '## fast_html_parser ##'
node fast_html_parser_test.js
cd ..

# c++
echo '### c++ ###'
cd cxx
echo '## gumbo_query ##'
./gumbo_query_test.out
