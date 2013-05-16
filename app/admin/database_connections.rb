ActiveAdmin.register DatabaseConnection do

  index do
    selectable_column
    id_column
    column :name
    column :kind
    column :adapter
    column :host
    column :username
    column :database
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :kind, as: :select, collection: DatabaseConnection::TYPES
      f.input :adapter, as: :select, collection: DatabaseConnection::ADAPTERS
      f.input :host
      f.input :username
      f.input :password
      f.input :database
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :kind
      row :adapter
      row :host
      row :username
      row :database
    end
    active_admin_comments
  end
end
