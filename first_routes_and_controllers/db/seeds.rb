# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


ActiveRecord::Base.transaction do

    puts 'Destroying tables...'
    User.delete_all
    Artwork.delete_all
    ArtworkShare.delete_all
    # Comment.delete_all

    puts 'Resetting id sequences...'
    %w(users artworks artwork_shares).each do |table_name|
      ApplicationRecord.connection.reset_pk_sequence!(table_name)
    end

    puts 'Creating seed data...'

    #3 users, sam, carlos, gary

    sam = User.create!(
        username: 'samuelskim1'
    )

    carlos = User.create!(
        username: 'carlos'
    )

    gary = User.create!(
        username: 'gary'
    )


    #Sam has 2 artworks, Carlos has next 2, Gary has 1, all in sequential order
    artwork1 = Artwork.create!(
        title: 'Art1User1',
        image_url: 'Art1',
        artist_id: 1
    )

    artwork2 = Artwork.create!(
        title: 'Art2User1',
        image_url: 'Art2',
        artist_id: 1
    )


    artwork3 = Artwork.create!(
        title: 'Art1User2',
        image_url: 'Art3',
        artist_id: 2
    )

    artwork4 = Artwork.create!(
        title: 'Art2User2',
        image_url: 'Art4',
        artist_id: 2
    )

    artwork5 = Artwork.create!(
        title: 'Art1User3',
        image_url: 'Art5',
        artist_id: 3
    )

    #sam views a total of 2 artworks, 1 carlos, 1 gary
    ArtworkShare.create!(
        viewer_id: 1,
        artwork_id: 3
    )

    ArtworkShare.create!(
        viewer_id: 1,
        artwork_id: 5
    )
    #carlos views a total of 1 artwork, 1 sam
    ArtworkShare.create!(
        viewer_id: 2,
        artwork_id: 1
    )

    #gary views 3 total artworks, 2 sams artworks, 1 carlos artwork
    ArtworkShare.create!(
        viewer_id: 3,
        artwork_id: 1
    )

    ArtworkShare.create!(
        viewer_id: 3,
        artwork_id: 2
    )

    ArtworkShare.create!(
        viewer_id: 3,
        artwork_id: 3
    )


    # Comment.create!(
    #     author_id:1,
    #     artwork_id:3,
    #     body: 'hi'
    # )

    # Comment.create!(
    #     author_id:2,
    #     artwork_id:1,
    #     body: 'commenting on Sams first art'

    # )


    # Comment.create!(
    #     author_id:3,
    #     artwork_id:1,
    #     body: 'second comment on Sams first art'

    # )
end