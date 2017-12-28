ActiveAdmin.register Center do
  menu parent: "Utilisateurs", label: "REV"

  permit_params :password, :email, :first_name, :last_name, :phone_number, :circonscription

  index :title => 'REV' do
    selectable_column
    id_column
    column "Prénom", :first_name
    column "Nom", :last_name
    column :circonscription
    column "Date de création", :created_at
    actions
  end

  show do
    attributes_table  do
      row "Prénom" do
        center.first_name
      end
      row "Nom" do
        center.last_name
      end
      row :email
      row "Numéro de téléphone" do
        center.phone_number
      end
      row :circonscription
      table_for center.schools do
        column "Ecoles", :name
      end
      table_for center.offers do
        column "Offres", :date
      end
    end
    panel "Details", only: :show do
      attributes_table_for center do
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
      f.input :phone_number, :label => "Numéro de téléphone"
      f.input :circonscription, :label => 'Circonscription', :as => :select, :collection => Circonscription.all.map{|u| ["#{u.name}"]}
    end
    f.actions
  end

end
