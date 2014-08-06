require_relative 'api_reader'

module LcboApi
  class Dataset
    extend ApiReader

    attr_reader :id,
                :added_product_ids,
                :added_store_ids,
                :created_at,
                :csv_dump,
                :product_ids,
                :removed_product_ids,
                :removed_store_ids,
                :store_ids,
                :total_inventories,
                :total_products,
                :total_product_inventory_count,
                :total_product_inventory_volume_in_milliliters,
                :total_product_inventory_price_in_cents,
                :total_stores

    def self.endpoint
      "/datasets"
    end

    def self.latest
      fetch_by_url endpoint + '/latest'
    end
  end
end
