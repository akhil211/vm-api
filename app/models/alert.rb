class Alert < ApplicationRecord

	# associations
	belongs_to :user
	# belongs_to :guardian
	# belongs_to :teacher
	# belongs_to :principal
	# belongs_to :admin

	# enums
	enum is_read: {read: true, unread: false}

end
