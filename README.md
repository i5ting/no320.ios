# no320.framework

this is a gem for preview and edit api/josn file use brower.most time we like use teminal and vim,so i write this gem.

## Installation

Add this line to your application's Gemfile:

    gem 'bee_api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bee_api

## Usage

g是get的简便方法，直接输入url地址即可

	$ bee_api -g http://top.baidu.com/news/pagination\?pageno\=1
	
如果使用文件配置方法，既可以支持get方法也可以支持post方法

	$ bee_api -f t1.json


配置文件见Test部分


## Test

 
ruby -Ilib bin/bee_api -g http://top.baidu.com/news/pagination\?pageno\=1

ruby -Ilib bin/bee_api -f t1.json


	{
	    "url": "http://platform.baidu.com.cn/kzx/userLoginNew",
	    "params": {
	        "app_key": "3672927202",
	        "client_id": "809359998",
	        "client_secret": "16eb6b6412f503c2bb90803fe256a57b",
	        "format": "json",
	        "grant_type": "password",
	        "identity": "86c26f7638fce2966ffee46bbb112d91",
	        "password": "＊＊＊＊＊＊",
	        "username": "shiren1118"
	    },
	    "method": "post"
	}
	
ruby -Ilib bin/bee_api -f t2.json

	{
	    "url": "http://top.baidu.com/news/pagination\?pageno\=1",
	    "params": {
	    },
	    "method": "get"
	}
	

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request



## 欢迎fork和反馈

shiren1118@126.com

