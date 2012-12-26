module Readpoint
  class Vpublication
    attr_reader :id, :name, :price, :promo, :thumbnail, :alias, :type, :cat_parent_id, :pbi_date
    def initialize( publication )
      @id = publication[:@id]
      @name = publication[:@name]
      @price = publication[:@price]
      @promo = publication[:@promo]
      @thumbnail = publication[:@thumbnail]
      @alias = publication[:@alias]
      @type = publication[:@type]
      @cat_parent_id = publication[:@cat_parent_id]
      @pbi_date = publication[:@pbi_date]
    end
  end
end