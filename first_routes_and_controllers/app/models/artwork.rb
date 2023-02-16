class Artwork < ApplicationRecord
    validates :title, :image_url, :artist_id, presence: true
    validates :artist_id, uniqueness: {scope: :title, message: "An artist cannot have artworks with the same name"}
    validates :image_url, uniqueness: true

    def self.artworks_for_user_id(user_id)
        owned_artwork = Artwork.joins(:artist)
        .where("artworks.artist_id = #{user_id}").select("*")
        shared_artwork = User.joins(:shared_artworks).select("*")
        .where("users.id = #{user_id}")

        owned_artwork + shared_artwork
    end

    belongs_to :artist,
        primary_key: :id,
        foreign_key: :artist_id,
        class_name: :User

    has_many(:artwork_shares,
        primary_key: :id,
        foreign_key: :artwork_id,
        class_name: 'ArtworkShare',
        dependent: :destroy,
        inverse_of: :artwork
    )

    has_many :shared_viewers,
        through: :artwork_shares,
        source: :viewer

    has_many :comments,
        primary_key: :id,
        foreign_key: :artwork_id,
        class_name: :Comment,
        dependent: :destroy,
        inverse_of: :artwork
end
