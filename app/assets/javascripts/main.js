//スライドショー

$(function () {
  var slick = $('#mainSlide').slick({
    slidesToShow: 1, //一度に表示するスライド枚数
    autoplay: true, //自動スライドするか(true or false)
    autoplaySpeed: 4000, //自動スライド速度(ミリ秒単位)
    pauseOnFocus: false, //スライドクリック時に停止するか(true or false)
    draggable: false,//ドラッグでスライダーを動かせるか(true or false)
    speed: 800,//ページ送りの速度(ミリ秒単位)
    centerMode: true,//表示中の画像を中おい配置するか(true or false)
    pauseOnHover:false,//マウスオーバー時にスライドを止めるか(true or false)
    dots: true,//現在の表示を示すポインタを表示するか(true or false)
    arrows: true,//ページ送りの矢印を表示するか(true or false)
    fade: false,//スライドの仕方をフェードインアウトにするか(true or false)
    variableWidth: true,//スライダー内の画像サイズを本来の画像サイズにするか(true or false)
    appendArrows: $('#arrows')
  });
});

$('.slick-next').on('click', function () {
  slick.slickNext();
});
$('.slick-prev').on('click', function () {
  slick.slickPrev();
});