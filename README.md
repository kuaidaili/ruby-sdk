# 快代理SDK - Ruby

## API部分:

### api.rb
使用内置模块`net/http`调用api示例, http/https网页均适用

### api_httparty.rb
使用第三方模块`httparty`调用api示例, http/https网页均适用

## Http部分:

### http_whitelist.rb:
以IP白名单认证的方式使用内置模块`net/http`请求Http代理服务器, http/https网页均适用

### http_auth.rb:
以用户名密码认证的方式使用内置模块`net/http`请求Http代理服务器, http/https网页均适用

### http_httparty_whitelist.rb
以IP白名单认证的方式使用第三方模块`httparty`请求Http代理服务器, http/https网页均适用
```
使用提示: 请先安装httparty模块: gem install httparty
```

### http_httparty_auth.rb
以用户名密码认证的方式使用第三方模块`httparty`请求Http代理服务器, http/https网页均适用
```
使用提示: 请先安装httparty模块: gem install httparty
```

## 隧道代理部分
### tps_nethttp_whitelist.rb
以IP白名单认证的方式使用内置模块`net/http`请求隧道代理服务器, http/https网页均适用

### tps_nethttp_auth.rb
以用户名密码认证的方式使用内置模块`net/http`请求隧道代理服务器, http/https网页均适用

### tps_httparty_whitelist.rb
以IP白名单认证的方式使用第三方模块`httparty`请求隧道代理服务器, http/https网页均适用
```
使用提示: 请先安装httparty模块: gem install httparty
```

### tps_httparty_auth.rb
以用户名密码认证的方式使用第三方模块`httparty`请求隧道代理服务器, http/https网页均适用
```
使用提示: 请先安装httparty模块: gem install httparty
```




## Socks部分

### socks_whitelist.rb:
以IP白名单的认证方式使用第三方模块`socksify`请求Socks代理服务器, http/https网页均适用
```
使用提示: 请先安装socksify模块: gem install socksify
```

### socks_auth.rb:
以用户名密码的认证方式使用第三方模块`socksify`请求Socks代理服务器, http/https网页均适用
```
使用提示: 请先安装socksify模块: gem install socksify
```