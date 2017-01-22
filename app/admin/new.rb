ActiveAdmin.register New do

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
  permit_params :title, :content, :planned_at, :photos

  form do |f|
    f.inputs "Caractéristiques" do
      f.input :title
      f.input :content
      f.input :planned_at
      f.input :photos, as: :formtastic_attachinary
    end
    f.actions
  end

end
