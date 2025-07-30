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
  // Fetch latest 5 scores from GameScores table
  const res = await fetch('/gamescores/latest');
  const scores = res.ok ? await res.json() : [];
  html += `<div class='attempts-title'>All Games (latest 5):</div>`;
  if (scores.length === 0) {
    html += `<div class='attempts-none'>No attempts yet.</div>`;
  } else {
    html += '<ul class="attempts-ul">' + scores.map(a => `<li>Score: ${a.Score} / ${a.TotalQuestions} <span class='attempt-date'>${formatDate(a.Timestamp)}</span></li>`).join('') + '</ul>';
  }
  attemptsList.innerHTML = html;
}

function formatDate(dateStr) {
  if (!dateStr) return '';
  const d = new Date(dateStr);
  return d.toLocaleString();
}
