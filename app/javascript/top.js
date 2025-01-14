document.addEventListener("DOMContentLoaded", function() {
  const myBtn = document.getElementById("myBtn");

  if (!myBtn) {
    console.warn("myBtn 要素が見つかりませんでした");
    return; // 要素がない場合は処理を終了
  }

  // スクロール位置が一定になるとボタンを表示
  window.addEventListener("scroll", function() {
    const scrollTop = document.documentElement.scrollTop || document.body.scrollTop;
    if (scrollTop > 100) {
      myBtn.style.display = "block";
    } else {
      myBtn.style.display = "none";
    }
  });

  // ボタンをクリックしたときにトップへスムーズにスクロール
  myBtn.addEventListener("click", function() {
    window.scrollTo({
      top: 0,
      behavior: "smooth"
    });
  });
});