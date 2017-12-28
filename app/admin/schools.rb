ActiveAdmin.register School do
  menu parent: "Objets", label: "Ecoles"

  permit_params :name, :address, :circonscription, :center_id

  index :title => 'Ecoles' do
    selectable_column
    id_column
    column "Nom de l'école", :name
    column :circonscription
    column "Date de création", :created_at
    column "REV", :center_id do |deal|
      if deal.center.full_name.present?
        deal.center.full_name
      else
        status_tag('Empty')
      end
    end
    actions
  end

  show do
    attributes_table  do
      row "Nom de l'école" do
        school.name
      end
      row "Adresse" do
        school.address
      end
      row :circonscription
      row "REV" do
        school.center.full_name
      end
    end
    panel "Details", only: :show do
      attributes_table_for school do
        row :created_at
        row :updated_at
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :name, :label => "Nom de l'école"
      f.input :address, :label => "Adresse"
      f.input :circonscription, :label => 'Circonscription', :as => :select, :collection => Circonscription.all.map{|u| ["#{u.name}"]}
      f.input :center_id, :label => 'REV', :as => :select, :collection => Center.all.map{|u| ["#{u.full_name}", u.id]}
    end
    f.actions
  end

end
