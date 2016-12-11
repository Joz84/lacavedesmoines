ActiveAdmin.register Product do

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

  form do |f|
    f.inputs "Identity" do
      f.input :name
      f.input :description
    end
    f.inputs "Country" do
      f.input :country
      f.input :photos, as: :formtastic_attachinary
    end
    f.actions
  end


  permit_params :name,
                :alcohol,
                :description,
                :brewery,
                :region,
                :country,
                :capacity,
                :kind,
                :color,
                :fermentation,
                :degree,
                :specificity,
                :returnable,
                :price,
                :promotion,
                :rating,
                :sku,
                :ratebeer,
                :photos
end
