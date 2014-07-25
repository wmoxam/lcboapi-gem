module LcboApi
  class ApiCollection
    include Enumerable

    def initialize(params)
      @klass = params[:klass]
      @pager = params[:pager]
      @last_loaded_collection = []

      @collection = instantiate_objects(params[:data])
    end

    def each(&block)
      @collection.each do |member|
        block.call(member)
      end

      while next_page
        @last_loaded_collection.each do |member|
          block.call(member)
        end
      end
    end

    def length
      @pager['total_record_count']
    end

    private

    def instantiate_objects(data)
      data.map do |hash|
        @klass.create_instance hash
      end
    end

    def next_page
      return nil if @pager['next_page_path'].nil?

      data = begin
        open(@pager['next_page_path'])
      rescue OpenURI::HTTPError
        return []
      end

      json = JSON.parse(data.read)
      return [] unless json['status'] == 200

      @pager = json['pager']
      @last_loaded_collection = instantiate_objects(json['result'])
      @collection.concat @last_loaded_collection
    end
  end
end
