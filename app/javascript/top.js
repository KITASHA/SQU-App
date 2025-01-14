document.addEventListener("DOMContentLoaded", function() {
  // スクロール位置が一定になるとボタンを表示
  window.onscroll = function() {
    let myBtn = document.getElementById("myBtn");
    if (myBtn) {
      if (document.body.scrollTop > 100 || document.documentElement.scrollTop > 100) {
        myBtn.style.display = "block"; // 100px以上スクロールされたら表示
      } else {
        myBtn.style.display = "none"; // それ以下なら非表示
      }
    }
  };

  // ボタンが存在する場合にイベントリスナーを追加
  let myBtn = document.getElementById("myBtn");
  if (myBtn) {
    myBtn.addEventListener("click", function() {
      window.scrollTo({
        top: 0,
        behavior: "smooth"
      });
    });
  }
});

// turbo:load イベント時にページのトップへ戻る処理を追加（不要であれば削除）
window.addEventListener("turbo:load", function() {
  window.scrollTo({
    top: 0,
    behavior: "smooth"
  });
});
