ActiveAdmin.register Circonscription do
  menu parent: "Objets", label: "Circonscription"

  permit_params :name

  index :title => 'Circonscriptions' do
    selectable_column
    id_column
    column "Nom", :name
    column "Date de création", :created_at
    actions
  end

  show do
    attributes_table  do
      row "Nom" do
        circonscription.name
      end
    end
    panel "Details", only: :show do
      attributes_table_for circonscription do
        row :created_at
        row :updated_at
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :name, :label => "Nom"
    end
    f.actions
  end

end
