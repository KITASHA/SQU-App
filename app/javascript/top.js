document.addEventListener("DOMContentLoaded", function() {
  const myBtn = document.getElementById("myBtn");

  // ボタンを常に表示
  myBtn.style.display = "block";

  // ボタンをクリックしたときにトップへスムーズにスクロール
  myBtn.addEventListener("click", function() {
    window.scrollTo({
      top: 0,
      behavior: "smooth"
    });
  });
});
