crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", "/users/#{params[:id]}"
  parent :root
end

crumb :news do
  link "お知らせ",  "/mypage/notification"
  parent :mypage
end

crumb :todo do
  link "やる事リスト",  "/mypage/todo"
  parent :mypage
end

crumb :good do
  link "いいね！一覧",  ""
  parent :mypage
end

crumb :exhibit do
  link "出品する",  "/items/new"
  parent :mypage
end

crumb :exhibiting do
  link "出品した商品ー出品中",  ""
  parent :mypage
end

crumb :transaction do
  link "出品した商品ー取引中",  ""
  parent :mypage
end

crumb :sold do
  link "出品した商品ー売却済",  ""
  parent :mypage
end

crumb :transaction_buy do
  link "購入した商品ー取引中",  "/mypage/purchase"
  parent :mypage
end

crumb :transaction_past do
  link "購入した商品ー過去の取引",  "/mypage/purchased"
  parent :mypage
end

crumb :news_list do
  link "ニュース一覧",  ""
  parent :mypage
end

crumb :evaluation do
  link "評価一覧",  ""
  parent :mypage
end

crumb :guide do
  link "ガイド",  ""
  parent :mypage
end

crumb :sales do
  link "売上げ・振込申請",  ""
  parent :mypage
end

crumb :point do
  link "ポイント",  ""
  parent :mypage
end

crumb :profile do
  link "プロフィール",  "mypage/#{params[:id]}/edit"
  parent :mypage
end

crumb :shipping_origin do
  link "発送元・お届け先住所変更",  "/users/#{params[:id]}/addresses/#{params[:id]}/edit"
  parent :mypage
end

crumb :payment do
  link "支払い方法",  "/cards"
  parent :mypage
end

crumb :mail_pass do
  link "メール/パスワード",  "/users/#{params[:id]}/edit"
  parent :mypage
end

crumb :personal_information do
  link "本人情報",  "/mypage/mydate"
  parent :mypage
end

crumb :tel_confimation do
  link "電話番号の確認",  "/mypage/authenticate_phone"
  parent :mypage
end

crumb :logout do
  link "ログアウト",  "/logout"
  parent :mypage
end






