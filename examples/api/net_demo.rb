# -*- coding: utf-8 -*-

require 'net/http'  # 引入内置net/http模块
require 'zlib'
require 'stringio'

# 要访问的目标网页, 以京东首页为例
page_url = 'https://www.jd.com'
uri = URI(page_url)

# 创建新的请求对象
req = Net::HTTP::Get.new(uri)

# 设置User-Agent
req['User-Agent'] = 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_8; en-us) AppleWebKit/534.50 (KHTML, like Gecko) Version/5.1 Safari/534.50'
req['Accept-Encoding'] = 'gzip'  # 使用gzip压缩传输数据让访问更快

# 发起请求, 若访问的是http网页, 请将use_ssl设为false
res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => true) {|http|
    http.request(req)
}

# 输出状态码
puts "status code: #{res.code}"

# 输出响应体
if  res.code.to_i != 200 then
    puts "page content: #{res.body}"
else
    gz = Zlib::GzipReader.new(StringIO.new(res.body.to_s))
    puts "page content: #{gz.read}"
end