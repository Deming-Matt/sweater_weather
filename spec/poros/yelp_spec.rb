require 'rails_helper'

RSpec.describe Yelp do
  it 'exists and has attributes' do
    yelp = {:forecast=>
   @conditions="clear sky",
   @dt="Mon, 08 Aug 2022 11:24:47 -0600",
   @feels_like=77.25,
   @humidity=54,
   @icon="01d",
   @sunrise="Mon, 08 Aug 2022 06:05:32 -0600",
   @sunset="Mon, 08 Aug 2022 20:05:40 -0600",
   @temp=77.29,
   @uvi=7.6,
   @visibility=10000>,
 :restaurant=>
  [{:id=>"VFACYV_lGv9y4FV-_1m4Ig",
    :alias=>"brooklyns-finest-pizza-lowell-denver",
    :name=>"Brooklyn's Finest Pizza - Lowell",
    :image_url=>"https://s3-media4.fl.yelpcdn.com/bphoto/6cPY-ZzCjPdyI_F_zOtsHA/o.jpg",
    :is_closed=>false,
    :url=>
     "https://www.yelp.com/biz/brooklyns-finest-pizza-lowell-denver?adjust_creative=Tf5bifDwn5MzpZoNXp4mfg&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=Tf5bifDwn5MzpZoNXp4mfg",
    :review_count=>463,
    :categories=>
     [{:alias=>"pizza", :title=>"Pizza"},
      {:alias=>"italian", :title=>"Italian"},
      {:alias=>"sandwiches", :title=>"Sandwiches"}],
    :rating=>4.5,
    :coordinates=>{:latitude=>39.7875680710371, :longitude=>-105.035032358198},
    :transactions=>["pickup", "delivery"],
    :price=>"$$",
    :location=>
     {:address1=>"5007 Lowell Blvd",
      :address2=>"",
      :address3=>"",
      :city=>"Denver",
      :zip_code=>"80221",
      :country=>"US",
      :state=>"CO",
      :display_address=>["5007 Lowell Blvd", "Denver, CO 80221"]},
    :phone=>"+13034770066",
    :display_phone=>"(303) 477-0066",
    :distance=>8009.779308214767}]}
    Yelp.new(yelp)

    expect(pizza_search).to be_a(Yelp)

  end
end
