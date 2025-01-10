document.addEventListener("DOMContentLoaded", function() {
  // スクロール位置が一定になるとボタンを表示
  window.onscroll = function() {
    let myBtn = document.getElementById("myBtn");
    if (document.body.scrollTop > 100 || document.documentElement.scrollTop > 100) {
      myBtn.style.display = "block"; // 100px以上スクロールされたら表示
    } else {
      myBtn.style.display = "none"; // それ以下なら非表示
    }
  };

  // ボタンがクリックされたときにtopFunctionを呼び出す
  document.getElementById("myBtn").addEventListener("click", topFunction);

  // ボタンがクリックされたらページの上に戻る
  function topFunction() {
    window.scrollTo({
      top: 0,
      behavior: "smooth"
    });
  }
});

window.addEventListener("turbo:load", topFunction);
