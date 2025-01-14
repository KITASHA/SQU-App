document.addEventListener("turbo:load", function() {
  const myBtn = document.getElementById("myBtn");

  if (myBtn) {
    myBtn.addEventListener("click", function() {
      window.scrollTo({
        top: 0,
        behavior: "smooth"
      });
    });
  }

  window.addEventListener("scroll", function() {
    if (myBtn) {
      if (document.body.scrollTop > 100 || document.documentElement.scrollTop > 100) {
        myBtn.style.display = "block";
      } else {
        myBtn.style.display = "none";
      }
    }
  });
});
