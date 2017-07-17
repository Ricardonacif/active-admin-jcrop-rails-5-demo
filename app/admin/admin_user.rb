ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation, :avatar, :avatar_url

  jcropable
  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  show do |user|
    attributes_table_for user do
      row :avatar_thumb do 
        image_tag user.avatar_url(:thumb)
      end
      row :avatar_original do 
        image_tag user.avatar_url(:thumb)
      end
    end
  end

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
    end
    f.inputs "Details" do
      f.input :avatar, as: :jcropable, hint: f.template.image_tag(f.object.avatar_url(:thumb))
    end                      

    f.actions
  end

end
