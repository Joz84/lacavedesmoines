ActiveAdmin.register Order do

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
#

  index do
    selectable_column
    column :id
    column :user
    column :address
    column :complement
    column :postal_code
    column :city
    column :country
    column :telephone
    column :state
    column :amount
    column :created_at
    actions
  end

  permit_params :deposit_id,
                :user_id,
                :delivery,
                :address,
                :complement,
                :postal_code,
                :city,
                :country,
                :telephone,
                :state,
                :amount
                # :payment



end
