// Add click handlers for game icons
document.getElementById('math-icon').addEventListener('click', function() {
  window.location.href = 'mathgame.html';
});
document.getElementById('colormatch-icon').addEventListener('click', function() {
  window.location.href = 'colormatch.html';
});
// Show My Attempts dropdown logic and fetch scores for both games
const attemptsBox = document.getElementById('attempts-box');
const attemptsList = document.getElementById('attempts-list');

let attemptsLoaded = false;

attemptsBox.addEventListener('click', async function() {
  this.classList.toggle('active');
  if (!attemptsLoaded) {
    await loadAttempts();
    attemptsLoaded = true;
  }
});


async function loadAttempts() {
  let html = '';
  
  try {
    // Get JWT token from localStorage
    const token = localStorage.getItem('token');
    
    if (!token) {
      html = `<div class='attempts-none'>Please log in to view your game attempts.</div>`;
      attemptsList.innerHTML = html;
      return;
    }
    
    console.log('Token found, making requests...');
    
    // Fetch Color Match attempts using JWT-protected endpoint
    const colorRes = await fetch(`/colormatch/attempts`, {
      headers: {
        'Authorization': `Bearer ${token}`,
        'Content-Type': 'application/json'
      }
    });
    
    console.log('Color response status:', colorRes.status);
    if (!colorRes.ok) {
      const errorText = await colorRes.text();
      console.log('Color error response:', errorText);
    }
    const colorAttempts = colorRes.ok ? await colorRes.json() : [];
    console.log('Color attempts:', colorAttempts);
    
    // Fetch Math Game attempts using JWT-protected endpoint
    const mathRes = await fetch(`/mathgame/attempts`, {
      headers: {
        'Authorization': `Bearer ${token}`,
        'Content-Type': 'application/json'
      }
    });
    
    console.log('Math response status:', mathRes.status);
    if (!mathRes.ok) {
      const errorText = await mathRes.text();
      console.log('Math error response:', errorText);
    }
    const mathAttempts = mathRes.ok ? await mathRes.json() : [];
    console.log('Math attempts:', mathAttempts);
    
    // Display Color Match attempts
    html += `<div class='attempts-title'>🎨 Color Match Game:</div>`;
    if (colorAttempts.length === 0) {
      html += `<div class='attempts-none'>No color match attempts yet.</div>`;
    } else {
      html += '<ul class="attempts-ul">';
      colorAttempts.slice(0, 5).forEach(attempt => {
        html += `<li>Score: ${attempt.Score}/${attempt.TotalQuestions} <span class='attempt-date'>${formatDate(attempt.Timestamp)}</span></li>`;
      });
      html += '</ul>';
    }
    
    // Display Math Game attempts
    html += `<div class='attempts-title'>➗ Math Game:</div>`;
    if (mathAttempts.length === 0) {
      html += `<div class='attempts-none'>No math game attempts yet.</div>`;
    } else {
      html += '<ul class="attempts-ul">';
      mathAttempts.slice(0, 5).forEach(attempt => {
        html += `<li>Score: ${attempt.Score}/${attempt.TotalQuestions} <span class='attempt-date'>${formatDate(attempt.Timestamp)}</span></li>`;
      });
      html += '</ul>';
    }
    
    // Fallback: if both games have no attempts
    if (colorAttempts.length === 0 && mathAttempts.length === 0) {
      html = `<div class='attempts-none'>No game attempts yet. Play some games to see your scores!</div>`;
    }
    
  } catch (error) {
    console.error('Error loading attempts:', error);
    html = `<div class='attempts-none'>Error loading attempts. Please try again.</div>`;
  }
  
  attemptsList.innerHTML = html;
}

function formatDate(dateStr) {
  if (!dateStr) return '';
  const d = new Date(dateStr);
  return d.toLocaleString();
}
