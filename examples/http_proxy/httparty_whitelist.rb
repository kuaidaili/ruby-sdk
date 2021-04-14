require "httparty"  # 引入httparty模块
require 'zlib'
require 'stringio'

# 代理服务器ip和端口
proxy_ip = '59.38.241.25'
proxy_port = 23916

# 要访问的目标网页, 以快代理testproxy页面为例
page_url = 'https://dev.kuaidaili.com/testproxy'

# 设置headers
headers = {
    "User-Agent" => "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_8; en-us) AppleWebKit/534.50 (KHTML, like Gecko) Version/5.1 Safari/534.50",
    "Accept-Encoding" => "gzip",
}

# 设置代理
options = {
    :headers => headers,
    :http_proxyaddr => proxy_ip,
    :http_proxyport => proxy_port,
}

# 发起请求
res = HTTParty.get(page_url, options)

# 输出状态码
puts "status code: #{res.code}"

# 输出响应体
if  res.code.to_i != 200 then
    puts "page content: #{res.body}"
else
    gz = Zlib::GzipReader.new(StringIO.new(res.body.to_s))
    puts "page content: #{gz.read}"
end