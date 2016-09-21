class Sidetrack < ActiveRecord::Base
  rails_admin do 
    list do
      exclude_fields 
    end

    parent Well
  end

  belongs_to :well, :foreign_key => :well_id
end