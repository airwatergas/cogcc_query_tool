class Well < ActiveRecord::Base
  rails_admin do 
    list do
      exclude_fields :facility_id
      sort_by :api_number
      field :api_number do
        sort_reverse false
      end
      field :scout_card_url do
        pretty_value do
          %{<a target="_blank" href="#{value}">#{value}</a>}.html_safe
        end
      end
    end
    show do
      exclude_fields :facility_id
      field :scout_card_url do
        pretty_value do
          %{<a target="_blank" href="#{value}">#{value}</a>}.html_safe
        end
      end
    end
    navigation_label 'Well Metadata'
    weight -20
  end
  belongs_to :location
end