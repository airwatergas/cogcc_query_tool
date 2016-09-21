class CommissionOrder < ActiveRecord::Base
  rails_admin do 
    label "Commission Order"
    list do
      exclude_fields 
      sort_by :id
      field :id do
        sort_reverse false
      end
      field :order_url do
        formatted_value do
          %{<a target="_blank" href="#{value}">#{value}</a>}.html_safe
        end
      end
    end
    show do
      exclude_fields 
      field :order_url do
        formatted_value do
          %{<a target="_blank" href="#{value}">#{value}</a>}.html_safe
        end
      end
    end
    navigation_label 'Related Resources'
  end
end