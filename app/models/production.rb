class Production < ActiveRecord::Base
  rails_admin do 
    label "Productions"
    list do
      exclude_fields 
      sort_by :well_id
      field :well_id do
        sort_reverse true
      end
    end
    parent Well
  end
  belongs_to :well, :foreign_key => :well_id
end