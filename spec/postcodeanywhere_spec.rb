require 'spec_helper'

describe PostcodeAnywhere do

  before do
      PostcodeAnywhere::Request.account_code = "bananas"
      PostcodeAnywhere::Request.license_code = "pears"
  end

  it "#lookup should return an array if the base items returns an array" do

    PostcodeAnywhere::PostcodeSearch.any_instance.stub(:get).and_return({"PostcodeAnywhere"=>{"Schema"=>{"Field"=>[{"Name"=>""}]},"Data"=>{"Items"=>"1", "Item"=>[] }}})

    expect(PostcodeAnywhere::PostcodeSearch.new(:country_code=> "GB", :postcode => "bn1 1al").lookup).to be_instance_of Array

  end

  it "#lookup should return an array if the base items returns a hash" do

    PostcodeAnywhere::PostcodeSearch.any_instance.stub(:get).and_return({"PostcodeAnywhere"=>{"Schema"=>{"Field"=>[{"Name"=>""}]},"Data"=>{"Items"=>"1", "Item"=>{} }}})

    expect(PostcodeAnywhere::PostcodeSearch.new(:country_code=> "GB", :postcode => "bn1 1al").lookup).to be_instance_of Array

  end

end