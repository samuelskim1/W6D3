class Artwork < ApplicationRecord
    validates :title, :image_url, :artist_id, presence: true
    validates :artist_id, uniqueness: {scope: :title, message: "An artist cannot have artworks with the same name"}
    validates :image_url, uniqueness: true

    belongs_to :artist,
        primary_key: :id,
        foreign_key: :artist_id,
        class_name: :User

    has_many(:artwork_shares,
        primary_key: :id,
        foreign_key: :artwork_id,
        class_name: 'ArtworkShare',
        dependent: :destroy
    )

    has_many :shared_viewers,
        through: :artwork_shares,
        source: :viewer

end
