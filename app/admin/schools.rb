ActiveAdmin.register School do
  menu label: "Ecoles"

  permit_params :name, :address, :circonscription, :center_id

  index do
    selectable_column
    id_column
    column :name
    column :circonscription
    column :created_at
    column :center_id do |deal|
      if deal.center.full_name.present?
        deal.center.full_name
      else
        status_tag('Empty')
      end
    end
    actions
  end

end
