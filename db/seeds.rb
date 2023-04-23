# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: 'test@test.com',
  password: '000000'
  )

  customers = Customer.create!(
    [
      {email: 'naoki@example.com', password: '000000', user_name: 'naoki', account_name: 'usm', account_image_url: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/user-usm.png"), filename:"user-usm.png")},
      {email: 'furga@example.com', password: '000000', user_name: 'furga', account_name: 'G', account_image_url: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/user-g.png"), filename:"user-g.png")},
      {email: 'shu@example.com', password: '000000', user_name: 'shu', account_name: 'aris', account_image_url: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/user-aris.png"), filename:"user-aris.png")},
      {email: 'ryuiti@example.com', password: '000000', user_name: 'ryuiti', account_name: 'd1', account_image_url: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/user-d1.png"), filename:"user-d1.png")},
      {email: 'taiti@example.com', password: '000000', user_name: 'taich', account_name: 'tetubor', account_image_url: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/user-tetubor.png"), filename:"user-tetubor.png")},
      {email: 'riho@example.com', password: '000000', user_name: 'riho', account_name: 'ry', account_image_url: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/user-ry.jpg"), filename:"user-ry.jpg")},
      {email: 'keita@example.com', password: '000000', user_name: 'keita', account_name: 'numa', account_image_url: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/user-numa.png"), filename:"user-numa.png")}
    ]
  )

   genres = Genre.create!(
    [
      {genre_name: 'オリジナル'},
      {genre_name: 'キャラクター'},
      {genre_name: 'アニマル'},
      {genre_name: '乗り物'},
      {genre_name: '文字（漢字)'},
      {genre_name: '文字（ひらがな)'},
      {genre_name: '文字（英語)'}
      ]
      )

  Item.create!(
    [
      {item_name: 'デンジャー', item_image_url: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/item-aris1.png"), filename:"item-aris1.png"), explanation:"危険な感じをイメージして作成しました。", genre_id: genres[0].id, customer_id: customers[2].id },
      {item_name: '真', item_image_url: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/item-aris2.png"), filename:"item-aris2.png"), explanation:"真実についてイメージしました。", genre_id: genres[0].id, customer_id: customers[2].id },
      {item_name: '不可思議', item_image_url: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/item-aris3.png"), filename:"item-aris3.png"), explanation:"オリジナルでキャラクターをデザインしました。", genre_id: genres[1].id, customer_id: customers[2].id },
      {item_name: '1ｔ', item_image_url: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/item-g1.png"), filename:"item-g1.png"), explanation:"酒につぶれる友をイメージして制作制作しました。", genre_id: genres[2].id, customer_id: customers[1].id },
      {item_name: 'usm', item_image_url: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/item-g2.png"), filename:"item-g2.png"), explanation:"内山という漢字を崩しロゴ風に制作しました。", genre_id: genres[0].id, customer_id: customers[1].id },
      {item_name: 'G', item_image_url: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/item-usm1.png"), filename:"item-usm1.png"), explanation:"オリジナルのキャラクターを友をイメージして制作しました。。", genre_id: genres[1].id, customer_id: customers[0].id }
      ]
  )

