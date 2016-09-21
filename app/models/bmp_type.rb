class BmpType < ActiveRecord::Base
  rails_admin do 
    label "BMP Type"
    list do
      exclude_fields
      sort_by :bmp_count
      field :bmp_count do
        sort_reverse true
      end
    end
    parent Well
  end
end