// Match the Colour Game (5 rounds, random each time)
const COLORS = [
  { name: 'Red', code: '#e74c3c' },
  { name: 'Blue', code: '#3498db' },
  { name: 'Green', code: '#27ae60' },
  { name: 'Yellow', code: '#f1c40f' },
  { name: 'Purple', code: '#9b59b6' },
  { name: 'Orange', code: '#ff9800' },
  { name: 'Pink', code: '#e84393' },
  { name: 'Brown', code: '#8d5524' }
];

let rounds = 5;
let current = 0;
let score = 0;
let attempts = [];
let quiz = [];

const colorWord = document.getElementById('color-word');
const tilesRow = document.getElementById('tiles-row');
const colorFeedback = document.getElementById('color-feedback');
const colorScoreBox = document.getElementById('color-score-box');
const endButtons = document.getElementById('color-end-buttons');
const tryAgainBtn = document.getElementById('color-try-again-btn');
const returnBtn = document.getElementById('color-return-btn');

function shuffle(arr) {
  for (let i = arr.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [arr[i], arr[j]] = [arr[j], arr[i]];
  }
  return arr;
}

function startGame() {
  quiz = [];
  for (let i = 0; i < rounds; i++) {
    // Pick a random color for the word
    const wordColor = COLORS[Math.floor(Math.random() * COLORS.length)];
    // Pick 3 other random colors for tiles (no duplicates)
    let tileColors = shuffle(COLORS.filter(c => c.name !== wordColor.name)).slice(0, 3);
    tileColors.push(wordColor);
    tileColors = shuffle(tileColors);
    quiz.push({ word: wordColor.name, correct: wordColor.code, tiles: tileColors });
  }
  current = 0;
  score = 0;
  attempts = [];
  endButtons.style.display = 'none';
  showRound();
}

function showRound() {
  if (current < quiz.length) {
    colorWord.textContent = quiz[current].word;
    colorWord.style.color = '#222';
    colorFeedback.textContent = '';
    colorScoreBox.textContent = '';
    tilesRow.innerHTML = '';
    quiz[current].tiles.forEach(tile => {
      const div = document.createElement('div');
      div.className = 'color-tile';
      div.style.background = tile.code;
      div.addEventListener('click', () => handleTile(tile.code));
      tilesRow.appendChild(div);
    });
  } else {
    colorWord.textContent = 'Game Over!';
    colorFeedback.textContent = '';
    colorScoreBox.textContent = '';
    tilesRow.innerHTML = '';
    endButtons.style.display = 'flex';
    // Show score below the buttons
    setTimeout(() => {
      colorScoreBox.textContent = `Your score: ${score} / ${quiz.length}`;
    }, 100);
    saveAttempt();
  }
}

function handleTile(selectedCode) {
  const correctCode = quiz[current].correct;
  const correct = selectedCode === correctCode;
  attempts.push({ word: quiz[current].word, selected: selectedCode, correct });
  if (correct) {
    score++;
    colorFeedback.textContent = 'Correct!';
  } else {
    colorFeedback.textContent = 'Wrong!';
  }
  current++;
  setTimeout(showRound, 900);
}

tryAgainBtn.addEventListener('click', () => {
  startGame();
});

returnBtn.addEventListener('click', () => {
  window.location.href = 'mingames.html';
});

function saveAttempt() {
  // For demo, use userId=1
  fetch('/colormatch/attempt', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ userId: 1, score, attempts })
  });
  // Also save to GameScores table
  fetch('/gamescores', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ score: score, totalQuestions: quiz.length })
  });
}

startGame();
