require "readpoint/version"
require "readpoint/product"
require "readpoint/category"
require "readpoint/npcategory"
require "readpoint/vpublication"
require "readpoint/constants"
require "savon"

module Readpoint
  class Request
    attr_reader :categories
    def initialize
      @bcategories = []
      @vitrina = []
      @npcategories = []
      
      Savon.client do 
        wsdl WSDL
        namespace "http://www.readpoint.com"
      end
      @client = Savon.client(wsdl: WSDL, 
                       env_namespace: :soapenv, 
                       namespace_identifier: :read,
                       soap_header:{"read:Header"=>{"read:username"=>CREDENTIALS[:user], "read:password" => CREDENTIALS[:password]}})
      # p @client.operations
    end
    def get_book_categories
      request = @client.call(:get_book_categories)
      items = request.body[:get_book_categories_response][:get_book_categories_result][:categories][:category]
      items.each{|item| @bcategories << Category.new( item )}
      @bcategories
    end
    
    def get_vitrina( name = 'MobileMagazines')
        # vitrinaName = @"MobileBooks";
        # vitrinaName = @"MobileNewspapers";
        # vitrinaName = @"MobileMagazines";
      request = @client.call(:get_vitrina) do
        message( {"vit_name" =>name} )
      end
      items = request.body[:get_vitrina_response][:get_vitrina_result][:vitrina][:publication]
      items.each{|item| @vitrina << Vpublication.new( item )}
      p @vitrina[0].inspect
      @vitrina
      # items.each{|item| @categories << EnaCategory.new( item )}
    end
    
    def get_news_paper_categories
      request = @client.call(:get_news_paper_categories)
      items = request.body[:get_news_paper_categories_response][:get_news_paper_categories_result][:categories][:category]
      items.each{|item| @npcategories << Npcategory.new( item )}
      p @npcategories[0].inspect
      @npcategories
    end

    def get_new_entries_newspapers
      arr = []

      request = @client.call(:get_new_entries_newspapers)
      items = request.body[:get_new_entries_newspapers_response][:get_new_entries_newspapers_result][:new_entries][:product]
      items.each{|item| arr << Product.new( item )}

      arr
    end
    
    def get_new_entries_magazine
      arr = []

      request = @client.call(:get_new_entries_magazine)
      items = request.body[:get_new_entries_magazine_response][:get_new_entries_magazine_result][:new_entries][:product]
      items.each{|item| arr << Product.new( item )}
      arr
    end

    def get_new_entries_book
      arr = []

      request = @client.call(:get_new_entries_book)
      items = request.body[:get_new_entries_book_response][:get_new_entries_book_result][:new_entries][:product]
      p items[0].keys.inspect
      items.each{|item| arr << Product.new( item )}
      p arr[0].inspect
      arr
    end
  end
end
