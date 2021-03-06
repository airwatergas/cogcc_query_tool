RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  config.total_columns_width = 1000
  config.default_items_per_page = 20
  config.main_app_name = ["AirWaterGas:", "COGCC Database"]

  #config.excluded_models << ""


  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard do                    # mandatory
      statistics false
    end
    index                         # mandatory
#    new
    export
#    bulk_delete
    show
#    edit
#    delete
#    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
