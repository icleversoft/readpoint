module Readpoint
  class Product
    attr_reader :id, :vit_index, :als_alias, :pbn_flags, :pbnname, :pbi_no, :pbi_id, :pbn_promo
    attr_reader :actualname, :pbi_date, :thumbnail, :pbn_oldprice, :pbi_title, :pbi_price, :pbi_pbn_id
    
    def initialize( publication )
      @id = publication[:@id]
      @vit_index = publication[:@vit_index]
      @als_alias = publication[:@als_alias]
      @pbn_flags = publication[:@pbn_flags]
      @pbnname = publication[:@pbnname]
      @pbi_title = publication[:@pbi_title]
      @pbi_no = publication[:@pbi_no]
      @pbi_id = publication[:@pbi_id]
      @pbi_pbn_id = publication[:@pbi_pbn_id]
      @pbi_price = publication[:@pbi_price]
      @pbn_promo = publication[:@pbn_promo]
      @actualname = publication[:@actualname]
      @pbi_date = publication[:@actualname]
      @pbn_oldprice = publication[:@pbn_oldprice]
      @thumbnail = publication[:@thumbnail]
    end
  end
end