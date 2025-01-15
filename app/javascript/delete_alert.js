const delete_alert = () => {
  const deleteButton = document.getElementById('delete_alert');
  
  // 要素が存在する場合のみイベントを追加
  if (deleteButton) {
    deleteButton.addEventListener('click', function(event) {
      // 削除確認ダイアログを表示
      if (confirm("本当に削除しますか？")) {
        // もし「はい」を選んだ場合、削除リクエストを送る
        fetch(this.href, {
          method: 'DELETE',
          headers: {
            'X-CSRF-Token': document.querySelector('[name="csrf-token"]').content
          }
        });
        // location.href = '/bands'; 
      } else {
        event.preventDefault(); // 「いいえ」を選んだ場合は、削除処理をキャンセル
      }
    });
  }
};

window.addEventListener("turbo:load", delete_alert);
