require_relative 'api_reader'

module LcboApi
  class Inventory
    extend ApiReader

    attr_reader :product_id,
                :store_id,
                :is_dead,
                :quantity,
                :updated_on,
                :updated_at,
                :product_no,
                :store_no

    def is_dead?
      is_dead
    end

    def product
      Product.find(product_id)
    end

    def store
      Store.find(store_id)
    end

    def self.endpoint
      '/inventories'
    end
  end
end
