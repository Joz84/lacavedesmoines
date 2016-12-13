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

  # index do
  #   selectable_column
  #   column :id
  #   column :user
  #   column :address
  #   column :complement
  #   column :postal_code
  #   column :city
  #   column :country
  #   column :telephone
  #   column :state
  #   column :amount
  #   column :created_at
  #   actions
  # end

  index do
    amount = 0
    column :amount
    column :created_at

    actions
    panel "Total: #{Order.search(params[:q]).result.sum(:amount_cents).to_f/100}"
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
                :payment

  form do |f|
    f.inputs "Caractéristiques" do
      f.input :deposit
      f.input :user
      f.input :delivery
      f.input :address
      f.input :complement
      f.input :postal_code
      f.input :city
      f.input :country
      f.input :telephone
      f.input :state
      f.input :amount
      f.input :created_at
    end
    f.actions
  end
end
