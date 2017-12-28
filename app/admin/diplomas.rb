ActiveAdmin.register Diploma do
  menu parent: "Objets", label: "Diplômes"

  permit_params :name

  index :title => 'Diplômes' do
    selectable_column
    id_column
    column "Nom", :name
    column "Date de création", :created_at
    actions
  end

  show do
    attributes_table  do
      row "Nom" do
        diploma.name
      end
    end
    panel "Details", only: :show do
      attributes_table_for diploma do
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
