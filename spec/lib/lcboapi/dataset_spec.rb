require 'spec_helper'

RSpec.describe LcboApi::Dataset do
  describe "retreival" do
    before do
      WebMock.stub_request(:get, "http://lcboapi.com/datasets/1").
           with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
           to_return(:status => 200, :body => '{"status":200,"message":null,"result":{"id":1}}', :headers => {})

      WebMock.stub_request(:get, "http://lcboapi.com/datasets/latest").
           with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
           to_return(:status => 200, :body => '{"status":200,"message":null,"result":{"id":2}}', :headers => {})

      WebMock.stub_request(:get, "http://lcboapi.com/datasets").
           with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
           to_return(:status => 200, :body => '{"status": 200,"message": null,"pager": {"records_per_page": 20,"total_record_count": 1010,"current_page_record_count": 20,"is_first_page": true,"is_final_page": false,"current_page": 1,"current_page_path": "/datasets?page=1","next_page": 2,"next_page_path": "/datasets?page=2","previous_page": null,"previous_page_path": null,"total_pages": 51,"total_pages_path": "/datasets?page=51"},"result": [{"id": 1188},{"id":1189}]}', :headers => {})
    end

    it "retreives by id" do
      expect(LcboApi::Dataset.find(1)).to be_an_instance_of(LcboApi::Dataset)
    end

    it "retrieves all" do
      collection = LcboApi::Dataset.all
      expect(collection).to be_an_instance_of(LcboApi::ApiCollection)
      expect(collection.first).to be_an_instance_of(LcboApi::Dataset)
    end

    it "retreives latest" do
      expect(LcboApi::Dataset.latest).to be_an_instance_of(LcboApi::Dataset)
    end
  end
end
