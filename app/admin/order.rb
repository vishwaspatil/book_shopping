ActiveAdmin.register Order do
actions :index, :show , :destroy
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :address, :email, :pay_type
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
 index do
	    selectable_column
	    id_column
	    column :name
	    column :address
	    column :email
	    column :pay_type
	    column :created_at
	    actions
	  end

	  filter :name
	  filter :address
	  filter :email
	  # filter :created_at

	  # form do |f|
	  #   f.inputs "Admin Details" do
	  #     f.input :name
	  #     f.input :password
	  #     f.input :password_confirmation
	  #   end
	  #   f.actions
	  # end

end
