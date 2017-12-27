ActiveAdmin.register Rhagent do
  menu label: "Celulle RH"

  permit_params :password, :email, :first_name, :last_name, :phone_number, :circonscription

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :circonscription
    column :created_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :circonscription, :label => 'Circonscription', :as => :select, :collection => Circonscription.all.map{|u| ["#{u.name}"]}
    end
    f.actions
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
