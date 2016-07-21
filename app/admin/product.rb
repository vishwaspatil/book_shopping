ActiveAdmin.register Product do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :title, :description, :image_url, :price
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
	    column :title
	    column :description
	    column :image_url
	    column :price
	    column :created_at
	    actions
	  end

	  filter :title
	  filter :description
	  # filter :image_url
	  filter :price

	  form do |f|
	    f.inputs "Product Details" do
	      f.input :title
	      f.input :description
	      f.input :image_url
	      f.input :price
	    end
	    f.actions
	  end

end
