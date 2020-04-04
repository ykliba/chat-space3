class Message < ApplicationRecord
    belongs_to :group
    belongs_to :user
    
    
    validates :content, presence: true, unless: :image?
    # if: :image?であれば、imageカラムが空でなければという意味になりますので、unless: :image?はimageカラムが空だったらという意味
    mount_uploader :image, ImageUploader
end
