$(function() {
  $('.item-edit__button__gray-delete').click(function() {
    $('#confirm-modal').fadeIn();
  });

  $('.close-modal').click(function() {
    $('#confirm-modal').fadeOut();
  });
  
  $('#cancel-btn').click(function() {
    $('#confirm-modal').fadeOut();
  });
  
});

// 画像切り替え

$(function() {
 $('img.thumb').mouseover(function(){
 // "_thumb"を削った画像ファイル名を取得
 var selectedSrc = $(this).attr('src').replace(/^(.+)_thumb(\.gif|\.jpg|\.png+)$/, "$1"+"$2");
 
 // 画像入れ替え
 $('img.mainImage').stop().fadeOut(50,
 function(){
 $('img.mainImage').attr('src', selectedSrc);
 $('img.mainImage').stop().fadeIn(200);
 }
 );
 // サムネイルの枠を変更
 $(this).css({"border":"1px solid #333","opacity":"1.0"});
 });
 
 // マウスアウトでサムネイル枠もとに戻す
 $('img.thumb').mouseout(function(){
 $(this).css({"border":"","opacity":"0.3"});
 });
});