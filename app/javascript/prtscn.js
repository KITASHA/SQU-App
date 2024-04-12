document.getElementById('screenshot-button').addEventListener('click', function() {
  html2canvas(document.body).then(function(canvas) {
      var imgData = canvas.toDataURL('image/png');
      // サーバーにスクリーンショットを送信するAjaxリクエストを行う
      saveScreenshot(imgData);
  });
});

function saveScreenshot(imageData) {
  // 例えば、fetch APIを使用してサーバーに送信します。
  fetch('/save_screenshot', {
      method: 'POST',
      headers: {
          'Content-Type': 'application/json',
      },
      body: JSON.stringify({ image_data: imageData }),
  })
  .then(response => {
      if (!response.ok) {
          throw new Error('Network response was not ok');
      }
      return response.json();
  })
  .then(data => {
      console.log(data);
      // 画像の保存が成功した場合の処理を記述
  })
  .catch(error => {
      console.error('There was a problem with your fetch operation:', error);
  });
}