# データベース設計 (2019.１０.５)

## usersテーブル（ユーザー）

1. User（ユーザー）はcard(クレカ情報）を１つしか持てない→１対１のため`has_one`使用
2. Trades(取引)とは多対多の関係のため、trade_member（中間テーブル）を通して関連づける
3. User（ユーザー）はreputations（評価）テーブル内にidを２つ(評価者と対象者)持っている

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, add_index|
|email|string|null: false, unique: true|
|password|string|null: false|
|image_url|string|null: false, default_image.jp|
|profile|text| |
|family_name|string|null: false|
|first_name|string|null: false|
|ja_family_name|string|null: false|
|ja_first_name|string|null: false|
|birthday|integer|null: false|
|postal_code|inteder|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building_name|string|null: false|
|delivery_phone|integer| |
|authenticate_phone|integer|null: false, unique: true|

### Association
- has_one :cards
- has_many :items
- has_many :item_comments
- has_many :likes
- has_many :trade_comments
- has_many :rater_users, foreign_key: "rater_id", class_name: "reputation"
　→`class_name`で、reputations（評価）テーブル内のrater_idを「rater_user」として紐付け。
- has_many :target_users, foreign_key: "target_id", class_name: "reputation"
　→同上
- has_many :saling_items, -> { where("buyer_id is NULL") }, foreign_key: "saler_id", class_name: "Item"
　→出品中
- has_many :trading_sold_items, -> { where("buyer_id is not NULL" AND "received_buyer_id is NULL") }, foreign_key: "saler_id", class_name: "Item"
　→出品取引中
- has_many :sold_items, -> { where("buyer_id is not NULL" AND "received_buyer_id is not NULL")  }, foreign_key: "saler_id", class_name: "Item"
　→売却済
- has_many :trading_bought_items, -> { where("received_buyer_id is NULL") }, foreign_key: "buyer_id", class_name: "Item"
　→購入取引中
- has_many :bought_items, -> { where("received_buyer_id is not NULL") }, foreign_key: "buyer_id", class_name: "Item"
　→購入済
---

## cardsテーブル（クレカ）
1. pay jpを使用した場合のテーブル
2. カード情報そのものを保存することは禁止されているらしい
3. pay jpに保管されている情報を顧客idやカードidで呼び出すことで情報取得や支払いなどに対応するらしい

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|customer_id|string|null: false|
|ecard_id|string|null: false|

### Association
- belongs_to :user
---

## item_commentsテーブル（コメント）

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|comment|text|null: false|

### Association
- belongs_to :user
- belongs_to :item
---

## likesテーブル（いいね！）
1. どのUserが,どのitem(商品)にいいね！をしたかを保存

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
---

## reputationsテーブル（評価）
1. reputations(評価)テーブルは、userの外部キーを２つ持っている。
2. カラムが「モデル名_id」という名前になっていないときは、`class_name :モデル名`オプションをつけて、モデルと関連付けをする必要があるため、class_nameオプションを追加。

|Column|Type|Options|
|------|----|-------|
|rater_id|integer|null: false, foreign_key: true|
|target_id|integer|null: false, foreign_key: true|
|rate|integer|null: false|
|comment|text|null: false|

### Association
- belongs_to :rater, class_name: 'User'
　→`class_name`でUserモデルと紐付け（擬似的に「raterモデル」を作り出すことで、rater_idとuser_idが紐づく）。
- belongs_to :target, class_name: 'User'
　→同上

---
## trade_commentsテーブル（取引コメント）

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|comment|text|null: false|

### Association
- belongs_to :user
- belongs_to :item

---
## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, add_index|
|price|integer|null: false|
|explanation|text|null: false|
|condition|string|null: false|
|shopping_charge|string|null: false|
|delivery_source_area|string|null: false|
|delivery_days|integer|null: false|
|commission|integer|null: false|
|profit|integer|null: false|
|category_id|references|null: false, foreign_key: true|
|brand_id|references|foreign_key: true|
|size_id|references|null: false, foreign_key: true|
|saler_id|integer|null: false, foreign_key: true|
|buyer_id|integer|foreign_key: true|
|shipped_saler_id|integer|foreign_key: true|
|received_buyer_id|integer|foreign_key: true|

### Association
- has_one :trade
- belongs_to :user
- has_many :comments
- has_many :likes
- has_many :images
- belongs_to :category
- belongs_to :brand
- belongs_to :size
- belongs_to :saler, class_name: 'User'
- belongs_to :buyer, class_name: 'User'
- belongs_to :shipped_saler, class_name: 'User'
- belongs_to :received_buyer, class_name: 'User'

---
## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|images_url|string|null: false|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item

---
## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|ancestry|string|add_index|
|name|string|null: false|

### Association
- has_many :items
- has_ancestry
---

## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|brand_group_num|integer|null: false|

### Association
- has_many :items

## sizesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|size_group_num|integer|null: false|

### Association
- has_many :items
