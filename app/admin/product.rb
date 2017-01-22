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
                :alcohol_id,
                :description,
                :brewery_id,
                :region_id,
                :country,
                :capacity,
                :kind_id,
                :color_id,
                :fermentation_id,
                :degree,
                :specificity_id,
                :returnable,
                :price,
                :promotion,
                :rating,
                :sku,
                :ratebeer,
                :photos

  form do |f|
    f.inputs "Identité" do
      f.input :name
      f.input :alcohol
      f.input :description
      f.input :photos, as: :formtastic_attachinary
    end
    f.inputs "Origine" do
      f.input :brewery
      f.input :region
      f.input :country
    end
    f.inputs "Spécificités" do
      f.input :kind
      f.input :color
      f.input :fermentation
      f.input :degree
      f.input :specificity
    end
    f.inputs "Logistique" do
      f.input :sku
      f.input :capacity
      f.input :returnable
      f.input :price
      f.input :promotion
    end
    f.inputs "Notes" do
      f.input :rating
      f.input :ratebeer
    end
    f.actions
  end


end
