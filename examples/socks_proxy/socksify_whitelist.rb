require 'socksify/http' # 引入socksify/http模块

# 要访问的目标网页, 以快代理testproxy页面为例
page_url = "https://dev.kuaidaili.com/testproxy"
uri = URI(page_url)

# 代理服务器ip和端口
proxy_ip = '59.38.241.25'
proxy_port = 23918

# 新建socks代理实例
proxy = Net::HTTP.SOCKSProxy(proxy_ip, proxy_port)

# 创建新的请求对象
req = Net::HTTP::Get.new(uri)
# 设置User-Agent
req['User-Agent'] = 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_8; en-us) AppleWebKit/534.50 (KHTML, like Gecko) Version/5.1 Safari/534.50'
req['Accept-Encoding'] = 'gzip'  # 使用gzip压缩传输数据让访问更快

# 使用代理发起请求, 若访问的是http网页, 请将use_ssl设为false
res = proxy.start(uri.hostname, uri.port, :use_ssl => true) do |http|
    http.request(req)
end

# 输出状态码
puts "status code: #{res.code}"

# 输出响应体
if  res.code.to_i != 200 then
    puts "page content: #{res.body}"
else
    gz = Zlib::GzipReader.new(StringIO.new(res.body.to_s))
    puts "page content: #{gz.read}"
end