module Admin::ShoppingsHelper
  def fields_for_shopping_item(shopping_item, &block)
    prefix = shopping_item.new_record? ? 'new' : 'exist'
    fields_for("shopping[#{prefix}_shopping_item_attributes][]", shopping_item, &block)
  end
  
  def tag_process_field(shopping)
    if(shopping.status != Shopping::FINISH_STATUS)
      link_to to_next_admin_shopping_path(shopping) ,:class=>'btn btn-success' do
        "变更为-#{shopping.next_status}"
      end

    end
    
  end
end