ActiveAdmin.register Rhagent do
  actions :index, :show, :edit, :destroy
  menu parent: "Utilisateurs", label: "Celulle Remplacement"

  permit_params :password, :email, :first_name, :last_name, :circonscription, :approved

  controller do
    def update
      @rhagent = Rhagent.find(params[:id])
      @rhagent.assign_attributes(permitted_params[:rhagent])
      @rhagent.save(validate: false)
      redirect_to edit_admin_rhagent_path(@rhagent), :notice => "Ce compte a bien été modifié"
    end
  end

  index :title => 'Cellule Remplacement' do
    selectable_column
    id_column
    column "Prénom", :first_name
    column "Nom", :last_name
    column :circonscription
    column "Date de création", :created_at
    column "Validé", :approved
    actions
  end

  show do
    attributes_table  do
      row "Prénom" do
        rhagent.first_name
      end
      row "Nom" do
        rhagent.last_name
      end
      row :email
      row :circonscription
      row "Validé" do
        rhagent.approved
      end
    end
    panel "Details", only: :show do
      attributes_table_for rhagent do
        row :created_at
        row :confirmed_at
        row :confirmation_token
        row :confirmation_sent_at
        row :unconfirmed_email
        row :updated_at
        row :last_sign_in_ip
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :first_name, :label => "Prénom"
      f.input :last_name, :label => "Nom"
      f.input :email
      f.input :circonscription, :label => 'Circonscription', :as => :select, :collection => Circonscription.all.map{|u| ["#{u.name}"]}
      f.input :approved, :label => "Validé"
    end
    f.actions
  end

end
