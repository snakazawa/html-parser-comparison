require 'oga'
require 'pathname'
require 'progress_bar/core_ext/enumerable_with_progress'

dir_path = Pathname.new(File.dirname(__FILE__)) + '..' + 'data' + 'pages'
pages = Dir::entries(dir_path).reject { |x| x.start_with?('.') }

err_cnt = 0

pages.with_progress.each do |page|
  begin
    doc = File.open(dir_path + page) { |f| Oga.parse_html(f) }
    node = doc.at_xpath('//h1')
    # puts node.text unless node.nil?
    # node = doc.at_xpath('//option')
    # puts node.text unless node.nil?
  rescue => e
    err_cnt += 1
  end
end

puts "err_cnt: #{err_cnt}"
