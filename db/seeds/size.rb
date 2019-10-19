#洋服のサイズブロック

#洋服のサイズの子カテゴリー配列
clothes_size_child_array = ['XXS以下','XS(SS)','S','M','L','XL(LL)','2XL(3L)','3XL(4L)','4XL(5L)以上','FREE SIZE']

parent = Size.create(name: '洋服のサイズ')
clothes_size_child_array.each.each_with_index do |child, i|
parent.children.create(name: child)
end

#メンズ靴のサイズブロック

#メンズ靴のサイズの子カテゴリー配列
mens_shoes_size_child_array = ['23.5cm以下','24cm','24.5cm','25cm','25.5cm','26cm','26.5cm','27cm','27.5cm','28cm','28.5cm','29cm','29.5cm','30cm','30.5cm','31cm以上']

parent = Size.create(name: 'メンズ靴のサイズ')
mens_shoes_size_child_array.each.each_with_index do |child, i|
parent.children.create(name: child)
end

#レディース靴のサイズブロック

#レディース靴のサイズの子カテゴリー配列
ladys_shoes_size_child_array = ['20cm以下','20.5cm','21cm','21.5cm','22cm','22.5cm','23cm','23.5cm','24cm','24.5cm','25cm','25.5cm','26cm','26.5cm','27cm','27.5cm以上']

parent = Size.create(name: 'レディース靴のサイズ')
ladys_shoes_size_child_array.each.each_with_index do |child, i|
parent.children.create(name: child)
end

#スカートのサイズブロック

#スカートのサイズの子カテゴリー配列
skirt_size_child_array = ['60cm以下','~70cm','~80cm','~90cm','90cm以上']

parent = Size.create(name: 'スカートのサイズ')
skirt_size_child_array.each.each_with_index do |child, i|
parent.children.create(name: child)
end

#キッズ服のサイズブロック

#キッズ服のサイズの子カテゴリー配列
kids_size_child_array = ['100cm','110cm','120cm','130cm','140cm','150cm','160cm']

parent = Size.create(name: 'キッズ服のサイズ')
kids_size_child_array.each.each_with_index do |child, i|
parent.children.create(name: child)
end

#ベビー・キッズ靴のサイズブロック

#ベビー・キッズ靴のサイズの子カテゴリー配列
baby_shoes_size_child_array = ['10.5cm以下','11cm・11.5cm','12cm・12.5cm','13cm・13.5cm','14cm・14.5cm','15cm・15.5cm','16cm・16.5cm','17cm以上']

parent = Size.create(name: 'ベビー・キッズ靴のサイズ')
baby_shoes_size_child_array.each.each_with_index do |child, i|
parent.children.create(name: child)
end

#ベビー服のサイズブロック

#ベビー服のサイズの子カテゴリー配列
baby_clothes_size_child_array = ['60cm','70cm','80cm','90cm','95cm']

parent = Size.create(name: 'ベビー服のサイズ')
baby_clothes_size_child_array.each.each_with_index do |child, i|
parent.children.create(name: child)
end

#テレビのサイズブロック

#テレビのサイズの子カテゴリー配列
tv_size_child_array = ['～20インチ','20～26インチ','26～32インチ','32～37インチ','37～40インチ','40～42インチ','42～46インチ','46～52インチ','52～60インチ','60インチ～']

parent = Size.create(name: 'テレビのサイズ')
tv_size_child_array.each.each_with_index do |child, i|
parent.children.create(name: child)
end

#カメラレンズのサイズブロック

#カメラレンズのサイズの子カテゴリー配列
camera_lens_size_child_array = ['ニコンFマウント','キヤノンEFマウント','ペンタックスKマウント','ペンタックスQマウント','フォーサーズマウント','マイクロフォーサーズマウント','α Aマウント','α Eマウント','ニコン1マウント','キヤノンEF-Mマウント','Xマウント','シグマSAマウント']

parent = Size.create(name: 'カメラレンズのサイズ')
camera_lens_size_child_array.each.each_with_index do |child, i|
parent.children.create(name: child)
end

#オートバイのサイズブロック

#オートバイのサイズの子カテゴリー配列
bike_size_child_array = ['50cc以下','51cc-125cc','126cc-250cc','251cc-400cc','401cc-750cc','751cc以上']

parent = Size.create(name: 'オートバイのサイズ')
bike_size_child_array.each.each_with_index do |child, i|
parent.children.create(name: child)
end

#ヘルメットのサイズブロック

#ヘルメットのサイズの子カテゴリー配列
helmet_size_child_array = ['XSサイズ以下','Sサイズ','Mサイズ','Lサイズ','XLサイズ','XXLサイズ以上','フリーサイズ','子ども用']

parent = Size.create(name: 'ヘルメットのサイズ')
helmet_size_child_array.each.each_with_index do |child, i|
parent.children.create(name: child)
end

#タイヤのサイズブロック

#タイヤのサイズの子カテゴリー配列
tire_size_child_array = ['12インチ','13インチ','14インチ','15インチ','16インチ','17インチ','18インチ','19インチ','20インチ','21インチ','22インチ','23インチ','24インチ']

parent = Size.create(name: 'タイヤのサイズ')
tire_size_child_array.each.each_with_index do |child, i|
parent.children.create(name: child)
end

#スキーのサイズブロック

#スキーのサイズの子カテゴリー配列
ski_size_child_array = ['140cm～','150cm～','160cm～','170cm～','スキーボード','子ども用','その他']

parent = Size.create(name: 'スキーのサイズ')
ski_size_child_array.each.each_with_index do |child, i|
parent.children.create(name: child)
end

#スノーボードのサイズブロック

#スノーボードのサイズの子カテゴリー配列
snowbord_size_child_array = ['135cm-140cm未満','140cm-145cm未満','145cm-150cm未満','150cm-155cm未満','155cm-160cm未満','160cm-165cm未満','165cm-170cm未満']

parent = Size.create(name: 'スノーボードのサイズ')
snowbord_size_child_array.each.each_with_index do |child, i|
parent.children.create(name: child)
end