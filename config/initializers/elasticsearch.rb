require 'elasticsearch/model'
require 'elasticsearch/transport'

Elasticsearch::Model.client = Elasticsearch::Client.new url: '127.0.0.1'