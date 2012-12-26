module Readpoint
  class Category
    attr_reader :cat_id, :cat_name, :parent_id
    def initialize( category )
      @cat_id = category[:@cat_id].to_i
      @cat_name = category[:@cat_name]
      @parent_id = category[:@cat_parent_id].to_i
    end
  end
end