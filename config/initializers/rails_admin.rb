RailsAdmin.config do |config|
	config.model Page do
	  edit do
	    field :name
	    field :permalink
	    field :content, :rich_editor do
	      config({
		:insert_many => true
	      })
	    end
	  end
	end

	config.model Picture do
	  edit do
	    field :name
	    field :photo_picture_id
	    field :slug
	    field :title
	    field :alt
	    field :image_mini, :rich_picker do
		  config({:allowed_styles => [:original],
			:view_mode => "list"})
	    end
	    field :image, :rich_picker do
		  config({:allowed_styles => [:original],
			:view_mode => "list"})
	    end
	    field :text, :rich_editor do
	      config({
		:insert_many => true
	      })
	    end
	  end
	end

	config.model PictureOrderCalc do
	  edit do
	    field :size
	    field :frame
	    field :human_count

	    field :comments, :rich_editor do
	      config({
		:insert_many => true
	      })
	    end
	    field :first_step, :rich_editor do
	      config({
		:insert_many => true
	      })
	    end
	    field :second_step, :rich_editor do
	      config({
		:insert_many => true
	      })
	    end
	    field :third_step, :rich_editor do
	      config({
		:insert_many => true
	      })
	    end
	    field :greeting, :rich_editor do
	      config({
		:insert_many => true
	      })
	    end
	  end
	end

	config.model PictureUserPhoto do
	  edit do
	    field :picture_order_id
	    field :image, :rich_picker do
		  config({:allowed_styles => [:original],
			:view_mode => "list"})
	    end
	  end
	end
end
