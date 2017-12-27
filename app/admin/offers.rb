ActiveAdmin.register Offer do
  menu label: "Offres"

  permit_params :date, :offer_number, :school_id, :center_id, :diploma_ids => [], :slot_ids => []

  index do
    selectable_column
    id_column
    column :date
    column :center_id do |deal|
      if deal.center.full_name.present?
        deal.center.full_name
      else
        status_tag('Empty')
      end
    end
    column :center_id do |deal|
      if deal.center.circonscription.present?
        deal.center.circonscription
      else
        status_tag('Empty')
      end
    end
    actions
  end

  show do
    panel "Tranches horaires" do
      table_for offer.slots do
        column :name
      end
    end

  end
  sidebar "User Information", only: [:show, :edit] do
    attributes_table_for offer do
      row :date
    end
  end


# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
