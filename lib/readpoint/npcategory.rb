module Readpoint
  class Npcategory
    attr_reader :cat_id, :cat_name, :parent_id, :parent_name
    def initialize( category )
      @cat_id = category[:@cat_id].to_i
      @cat_name = category[:@cat_name]
      @parent_id = category[:@cat_parent_id].to_i
      @parent_name = category[:@cat_parent_name]
    end
  end
end