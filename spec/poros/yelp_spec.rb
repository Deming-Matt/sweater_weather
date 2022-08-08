require 'rails_helper'

RSpec.describe Yelp do
  it 'exists and has attributes' do
    pizza = {
      :id=>"3kjN8Dlib5lWS7v7sI_gHQ",
      :alias=>"scileppis-at-the-old-stone-church-castle-rock",
      :name=>"Scileppi's at The Old Stone Church",
      :image_url=>"https://s3-media1.fl.yelpcdn.com/bphoto/ptpyfgGx2VTsjPIzhQvT8Q/o.jpg",
      :is_closed=>false,
      :url=>
       "https://www.yelp.com/biz/scileppis-at-the-old-stone-church-castle-rock?adjust_creative=Tf5bifDwn5MzpZoNXp4mfg&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=Tf5bifDwn5MzpZoNXp4mfg",
      :review_count=>332,
      :categories=>[{:alias=>"italian", :title=>"Italian"}, {:alias=>"pizza", :title=>"Pizza"}],
      :rating=>4.5,
      :coordinates=>{:latitude=>39.37199, :longitude=>-104.86114},
      :transactions=>["delivery"],
      :price=>"$$",
      :location=>
       {:address1=>"210 Third St",
        :address2=>"",
        :address3=>nil,
        :city=>"Castle Rock",
        :zip_code=>"80104",
        :country=>"US",
        :state=>"CO",
        :display_address=>["210 Third St", "Castle Rock, CO 80104"]},
      :phone=>"+13036889000",
      :display_phone=>"(303) 688-9000",
      :distance=>2157.3759898949324}


  end
end
