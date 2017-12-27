ActiveAdmin.register User do
  menu label: "Animateurs"
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :password, :email, :first_name, :last_name, :birthday, :soi_number, :phone_number, :circonscription, :diploma, :approved

controller do
  def update
    @user = User.find(params[:id])
    @user.assign_attributes(permitted_params[:user])
    @user.save(validate: false)
    redirect_to edit_admin_user_path(@user), :notice => "Ce compte a bien été modifié"
  end
end
index do
  selectable_column
  id_column
  column :email
  column :first_name
  column :last_name
  column :created_at
  column :approved
  actions
end

form do |f|
  f.inputs do
    f.input :soi_number
    f.input :approved
  end
  f.actions
end
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
