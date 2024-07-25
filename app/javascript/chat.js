const chat = () => {
  const form = document.getElementById('chat-form');
  const responseElement = document.getElementById('response');
  const promptElement = document.getElementById('prompt');

  if (!form || !responseElement || !promptElement) {
    console.error('Required HTML elements are missing.');
    return;
  }

  const csrfTokenElement = document.querySelector('meta[name="csrf-token"]');
  if (!csrfTokenElement) {
    console.error('CSRF token meta tag is missing.');
    return;
  }
  const csrfToken = csrfTokenElement.getAttribute('content');

  form.addEventListener('submit', function(event) {
    event.preventDefault();

    const prompt = promptElement.value;

    fetch('/chat/create', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': csrfToken
      },
      body: JSON.stringify({ prompt: prompt })
    })
    .then(response => {
      if (!response.ok) {
        throw new Error('Network response was not ok');
      }
      return response.json();
    })
    .then(data => {
      console.log('OpenAI Response:', data); // デバッグ用
      if (data.response && data.response.choices && data.response.choices.length > 0) {
        responseElement.innerText = data.response.choices[0].message.content;
      } else if (data.error) {
        responseElement.innerText = `Error: ${data.error.message}`;
      } else {
        throw new Error('Invalid response format');
      }
    })
    .catch(error => {
      responseElement.innerText = `Error: ${error.message}`;
    });
  });
}

document.addEventListener('DOMContentLoaded', chat);
