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
    // Use individual endpoints (for demo purposes, using userId = 1)
    const userId = 1;
    
    // Fetch Color Match attempts (GameId = 1)
    const colorRes = await fetch(`/colormatch/attempts/${userId}`);
    const colorAttempts = colorRes.ok ? await colorRes.json() : [];
    
    // Fetch Math Game attempts (GameId = 2) 
    const mathRes = await fetch(`/mathgame/attempts/${userId}`);
    const mathAttempts = mathRes.ok ? await mathRes.json() : [];
    
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
