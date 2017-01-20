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
      column do
        panel "N°" do
        end
      end
      column do
        panel "Nom" do
        end
      end
      column do
        panel "Adresse" do
        end
      end
      column do
        panel "Prix" do
        end
      end
      column do
        panel "Envois" do
        end
      end
      column do
        panel "Statut" do
        end
      end
    end

    Order.where(state: 'payée').map do |order|
      columns do
        column do
          # panel "Liste des commandes en cours" do
          # li link_to(order.title, admin_post_path(post))
          order.id
        end
        column do
          order.user.name
        end
        column do
          order.order_address
        end
        column do
          "#{order.amount} €"
        end
        column do
          order.postal_costs == 0 ? "livraison" : "colis"
        end
        column do
          link_to "effectué", root_path
        end
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
