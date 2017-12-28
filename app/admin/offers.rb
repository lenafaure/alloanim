ActiveAdmin.register Offer do
  menu parent: "Objets", label: "Offres"

  permit_params :date, :offer_number, :school_id, :center_id, :diploma_ids => [], :slot_ids => []

  index :title => 'Offres' do
    selectable_column
    id_column
    column "Date", :date
    column "REV", :center_id do |deal|
      if deal.center.full_name.present?
        deal.center.full_name
      else
        status_tag('Empty')
      end
    end
    column "Ecole", :school_id do |deal|
      if deal.school.present?
        deal.school.name
      else
        status_tag('Empty')
      end
    end
    column "Circonscription", :center_id do |deal|
      if deal.center.present?
        deal.center.circonscription
      else
        status_tag('Empty')
      end
    end
    actions
  end

  show do
    attributes_table  do
      row "Date" do
        offer.date
      end
      table_for offer.slots do
        column :name
      end
    end
    panel "Details", only: :show do
      attributes_table_for offer do
        row :created_at
        row :updated_at
      end
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
