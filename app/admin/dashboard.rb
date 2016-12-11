ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column { panel "N°" }
      column { panel "Nom" }
      column { panel "Adresse" }
      column { panel "Prix" }
      column { panel "Envois" }
      column { panel "Statut" }
    end

    Order.where(state: 'payée').map do |order|
      columns do
        column { order.id }
        column { order.user.name }
        column { order.order_address }
        column { "#{order.amount} €" }
        column { order.postal_costs == 0 ? "livraison" : "colis" }
        column { link_to "effectué", done_path(order.id), method: :patch }
      end
    end
    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
