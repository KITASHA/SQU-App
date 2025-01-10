// ボタンがクリックされたときにtopFunctionを呼び出す
document.getElementById("myBtn").addEventListener("click", topFunction);

// スクロール位置が一定になるとボタンを表示
window.onscroll = function() {
  let myBtn = document.getElementById("myBtn");
  if (document.body.scrollTop > 100 || document.documentElement.scrollTop > 100) {
    myBtn.style.display = "block"; // 100px以上スクロールされたら表示
  } else {
    myBtn.style.display = "none"; // それ以下なら非表示
  }
};

// ボタンがクリックされたらページの上に戻る
function topFunction() {
  document.body.scrollTop = 0; // Safari
  document.documentElement.scrollTop = 0; // Chrome, Firefox, IE
}