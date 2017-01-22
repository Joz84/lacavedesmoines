ActiveAdmin.register Brewery do

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
permit_params :name, :sku, :description, :partner, :photos

  form do |f|
    f.inputs "Caractéristiques" do
      f.input :name
      f.input :sku
      f.input :description
      f.input :partner
      f.input :photos, as: :formtastic_attachinary
    end
    f.actions
  end

end
