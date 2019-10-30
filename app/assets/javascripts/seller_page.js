document.addEventListener('DOMContentLoaded', function () {
  var
    dropArea = document.getElementById('dropArea'),
    output = document.getElementById('output'),

    // 画像の最大ファイルサイズ（20MB）
    maxSize = 20 * 1024 * 1024;

  // ドロップされたファイルの整理
  function organizeFiles(files) {
    var
      length = files.length,
      i = 0, file;

    for (; i < length; i++) {
      // file には Fileオブジェクト というローカルのファイル情報を含むオブジェクトが入る
      file = files[i];

      // 画像以外は無視
      if (!file || file.type.indexOf('image/') < 0) {
        continue;
      }

      // 指定したサイズを超える画像は無視
      if (file.size > maxSize) {
        continue;
      }

      // 画像出力処理へ進む
      outputImage(file);
    }
  }

  // 画像の出力
  function outputImage(blob) {
    var
      // 画像要素の生成
      image = new Image(),

      // File/BlobオブジェクトにアクセスできるURLを生成
      blobURL = URL.createObjectURL(blob);

    // src にURLを入れる
    image.src = blobURL;

    // 画像読み込み完了後
    image.addEventListener('load', function () {
      // File/BlobオブジェクトにアクセスできるURLを開放
      URL.revokeObjectURL(blobURL);

      // #output へ出力
      output.appendChild(image);
    });
  }

  // ドラッグ中の要素がドロップ要素に重なった時
  dropArea.addEventListener('dragover', function (ev) {
    ev.preventDefault();

    // ファイルのコピーを渡すようにする
    ev.dataTransfer.dropEffect = 'copy';

    dropArea.classList.add('dragover');
  });

  // ドラッグ中の要素がドロップ要素から外れた時
  dropArea.addEventListener('dragleave', function () {
    dropArea.classList.remove('dragover');
  });

  // ドロップ要素にドロップされた時
  dropArea.addEventListener('drop', function (ev) {
    ev.preventDefault();

    dropArea.classList.remove('dragover');
    output.textContent = '';

    // ev.dataTransfer.files に複数のファイルのリストが入っている
    organizeFiles(ev.dataTransfer.files);
  });

  // #dropArea がクリックされた時
  dropArea.addEventListener('click', function () {
    fileInput.click();
  });

  // ファイル参照で画像を追加した場合
  fileInput.addEventListener('change', function (ev) {
    output.textContent = '';

    // ev.target.files に複数のファイルのリストが入っている
    organizeFiles(ev.target.files);

    // 値のリセット
    fileInput.value = '';
  });
});

$(function(){
  $('input[type="input"]').on('input',function(){
    check_num($(this)); //入力する値を制限
});
});

// １．グローバル変数（一時的に保存しておく）を宣言
var _chknum_value = "";

function check_num(obj){
  // ２．変数の定義
  var txt_obj = $(obj).val();
  var txt_obj_change = txt_obj.replace(/[０-９]/g,function(s){return String.fromCharCode(s.charCodeAt(0)-0xFEE0)});
  var text_length = txt_obj.length;
  
  // ３．入力した文字が数字かどうかチェック
  if(txt_obj.match(/^[0-9０-９]+$/)){
         //全角を半角に変換
        if(txt_obj.match(/[０-９]/g)){
          _chknum_value = $(obj).val(txt_obj_change);
      }else{
            _chknum_value = txt_obj;
      }
  }else{
       // ３．２．入力した文字が数字ではないとき
       if(text_length == 0){
            _chknum_value = "";
       }else{
            $('input[type="input"]').val(_chknum_value);
       }
  }

  $(function(){
    $("#price_calc").keyup(function(){

    var data = $(this).val();
    var fee = Math.floor(data * 0.1);
    var profit = Math.floor(data - fee);
    
    // 価格設定300円〜9,999,999円
    if (data > 299 && data < 10000000 ) {
      $(".right_bar").text("¥" + fee.toLocaleString('ja-JP'));
      $(".right_bar_2").text("¥" + profit.toLocaleString('ja-JP'));
    } else {
      $(".right_bar").text("-");
      $(".right_bar_2").text("-");
    }
  });
});
}

$(document).on('turbolinks:load', function(){
  var dropzone = $('.dropzone-area');
  var dropzone2 = $('.dropzone-area2');
  var dropzone_box = $('.dropzone-box');
  var images = [];
  var inputs  =[];
  var input_area = $('.input_area');
  var preview = $('#preview');
  var preview2 = $('#preview2');

  $(document).on('change', 'input[type= "file"].upload-image',function(event) {
    var file = $(this).prop('files')[0];
    var reader = new FileReader();
    inputs.push($(this));
    var img = $(`<div class= "img_view" ><img  height="116" width="111"></div>`);
    reader.onload = function(e) {
      var btn_wrapper = $('<div class="btn_wrapper"><div class="btn edit">編集</div><div class="btn delete">削除</div></div>');
      img.append(btn_wrapper);
      img.find('img').attr({
        src: e.target.result
      })
    }
    reader.readAsDataURL(file);
    images.push(img);

    if(images.length >= 5) {
      dropzone2.css({
        'display': 'block'
      })
      dropzone.css({
        'display': 'none'
      })
      $.each(images, function(index, image) {
        image.attr('data-image', index);
        preview2.append(image);
        dropzone2.css({
          'width': `calc(100% - (135px * ${images.length - 5}))`
        })
      })
      if(images.length == 9) {
        dropzone2.find('p').replaceWith('<i class="fa fa-camera"></i>')
      }
    } else {
        $('#preview').empty();
        $.each(images, function(index, image) {
          image.attr('data-image', index);
          preview.append(image);
        })
        dropzone.css({
          'width': `calc(100% - (135px * ${images.length}))`
        })
      }
      if(images.length == 4) {
        dropzone.find('p').replaceWith('<i class="fa fa-camera"></i>')
      }
    if(images.length == 10) {
      dropzone2.css({
        'display': 'none'
      })
      return;
    }
    var new_image = $(`<input multiple= "multiple" name="images[image_url][]" class="upload-image" data-image= ${images.length} type="file" id="upload-image">`);
    input_area.prepend(new_image);
  });
  $(document).on('click', '.delete', function() {
    var target_image = $(this).parent().parent();
    $.each(inputs, function(index, input){
      if ($(this).data('image') == target_image.data('image')){
        $(this).remove();
        target_image.remove();
        var num = $(this).data('image');
        images.splice(num, 1);
        inputs.splice(num, 1);
        if(inputs.length == 0) {
          $('input[type= "file"].upload-image').attr({
            'data-image': 0
          })
        }
      }
    })
    $('input[type= "file"].upload-image:first').attr({
      'data-image': inputs.length
    })
    $.each(inputs, function(index, input) {
      var input = $(this)
      input.attr({
        'data-image': index
      })
      $('input[type= "file"].upload-image:first').after(input)
    })
    if (images.length >= 5) {
      dropzone2.css({
        'display': 'block'
      })
      $.each(images, function(index, image) {
        image.attr('data-image', index);
        preview2.append(image);
      })
      dropzone2.css({
        'width': `calc(100% - (135px * ${images.length - 5}))`
      })
      if(images.length == 9) {
        dropzone2.find('p').replaceWith('<i class="fa fa-camera"></i>')
      }
      if(images.length == 8) {
        dropzone2.find('i').replaceWith('<p>ココをクリックしてください</p>')
      }
    } else {
      dropzone.css({
        'display': 'block'
      })
      $.each(images, function(index, image) {
        image.attr('data-image', index);
        preview.append(image);
      })
      dropzone.css({
        'width': `calc(100% - (135px * ${images.length}))`
      })
    }
    if(images.length == 4) {
      dropzone2.css({
        'display': 'none'
      })
    }
    if(images.length == 3) {
      dropzone.find('i').replaceWith('<p>ココをクリックしてください</p>')
    }
  })
});