ActiveAdmin.register Deposit do

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

  permit_params :name,
                :sku,
                :address,
                :complement,
                :postal_code,
                :city,
                :country,
                :capacity,
                :siret,
                :description1,
                :description2,
                :description3,
                :photos



  form do |f|
    f.inputs "Caractéristiques" do
      f.input :name
      f.input :sku
      f.input :address
      f.input :complement
      f.input :postal_code
      f.input :city
      f.input :country
      f.input :capacity
      f.input :siret
      f.input :description1
      f.input :description2
      f.input :description3
      f.input :photos, as: :formtastic_attachinary
    end
    f.actions
  end

end
