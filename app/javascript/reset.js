const reset = () => {
  document.getElementById('reset-data').addEventListener('click', function() {
    if (confirm("本当にすべてのデータを削除しますか？")) {
      const password = prompt('パスワードを入力してください');
      fetch('/reset_all', {
        method: 'DELETE',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
        },
        body: JSON.stringify({password: password})
      }).then(response => {
        if (response.ok) {
          alert("データが正常に削除されました。");
          location.reload(); // ページをリロード
        } else {
          alert("データの削除中にエラーが発生しました。");
        }
      }).catch(error => {
        console.error('Error:', error);
        alert("データの削除中にエラーが発生しました。");
      });
    }
  });
}

window.addEventListener("turbo:load", reset);