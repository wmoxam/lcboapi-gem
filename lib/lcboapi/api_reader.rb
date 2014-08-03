require 'json'
require 'open-uri'

require_relative 'api_collection'

module LcboApi
  module ApiReader
    ENDPOINT_HOST = 'http://lcboapi.com'

    def find(id)
      fetch_by_url endpoint + '/' + id.to_s
    end

    def all
      data = begin
        open(ENDPOINT_HOST + endpoint)
      rescue OpenURI::HTTPError
        return []
      end

      json = JSON.parse(data.read)
      return [] unless json['status'] == 200

      LcboApi::ApiCollection.new({
        klass: self,
        pager: json['pager'],
        data:  json['result']
        })
    end

    def create_instance(params)
      instance = new.tap do |inst|
        params.each_pair do |k, v|
          inst.instance_variable_set("@#{k}", v)
        end
      end
    end

    private

    def fetch_by_url(url)
      data = begin
        open(ENDPOINT_HOST + url)
      rescue OpenURI::HTTPError
        return nil
      end

      json = JSON.parse(data.read)
      return nil unless json['status'] == 200

      create_instance json['result']
    end
  end
end
