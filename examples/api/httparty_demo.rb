require "httparty"  # 引入httparty模块
require 'zlib'
require 'stringio'

# 要访问的目标网页, 以京东首页为例
page_url = 'https://www.jd.com'

# 设置headers
headers = {
    "User-Agent" => "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_8; en-us) AppleWebKit/534.50 (KHTML, like Gecko) Version/5.1 Safari/534.50",
    "Accept-Encoding" => "gzip",
}

# 发起请求
res = HTTParty.get(page_url, :headers => headers)

# 输出状态码
puts "status code: #{res.code}"

# 输出响应体
if  res.code.to_i != 200 then
    puts "page content: #{res.body}"
else
    gz = Zlib::GzipReader.new(StringIO.new(res.body.to_s))
    puts "page content: #{gz.read}"
end