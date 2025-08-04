// Math Problem Game with random questions each time
const allQuestions = [
  { q: '4 + 5 = ?', a: 9 },
  { q: '7 - 3 = ?', a: 4 },
  { q: '6 x 2 = ?', a: 12 },
  { q: '15 / 3 = ?', a: 5 },
  { q: '8 + 7 = ?', a: 15 },
  { q: '9 - 6 = ?', a: 3 },
  { q: '3 x 4 = ?', a: 12 },
  { q: '18 / 2 = ?', a: 9 },
  { q: '5 + 8 = ?', a: 13 },
  { q: '10 - 7 = ?', a: 3 },
  { q: '7 x 3 = ?', a: 21 },
  { q: '20 / 4 = ?', a: 5 },
  { q: '6 + 9 = ?', a: 15 },
  { q: '12 - 8 = ?', a: 4 },
  { q: '2 x 7 = ?', a: 14 },
  { q: '16 / 2 = ?', a: 8 },
  { q: '11 + 5 = ?', a: 16 },
  { q: '14 - 9 = ?', a: 5 },
  { q: '8 x 2 = ?', a: 16 },
  { q: '21 / 7 = ?', a: 3 }
];

let questions = [];
let current = 0;
let score = 0;
let attempts = [];

const questionBox = document.getElementById('question-box');
const answerInput = document.getElementById('answer-input');
const submitBtn = document.getElementById('submit-btn');
const feedback = document.getElementById('feedback');
const scoreBox = document.getElementById('score-box');
const endButtons = document.getElementById('end-buttons');
const tryAgainBtn = document.getElementById('try-again-btn');
const returnBtn = document.getElementById('return-btn');

function shuffle(arr) {
  for (let i = arr.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [arr[i], arr[j]] = [arr[j], arr[i]];
  }
  return arr;
}

function startGame() {
  questions = shuffle([...allQuestions]).slice(0, 5);
  current = 0;
  score = 0;
  attempts = [];
  submitBtn.disabled = false;
  answerInput.disabled = false;
  endButtons.style.display = 'none';
  showQuestion();
}

function showQuestion() {
  if (current < questions.length) {
    questionBox.textContent = `Q${current + 1}: ${questions[current].q}`;
    answerInput.value = '';
    feedback.textContent = '';
    scoreBox.textContent = '';
    submitBtn.style.display = '';
    answerInput.style.display = '';
  } else {
    questionBox.textContent = 'Game Over!';
    feedback.textContent = '';
    scoreBox.textContent = `Your score: ${score} / ${questions.length}`;
    submitBtn.style.display = 'none';
    answerInput.style.display = 'none';
    endButtons.style.display = 'flex';
    submitBtn.disabled = true;
    answerInput.disabled = true;
    saveAttempt();
  }
}

submitBtn.addEventListener('click', () => {
  const val = parseInt(answerInput.value);
  if (isNaN(val)) {
    feedback.textContent = 'Please enter a number.';
    return;
  }
  attempts.push({ question: questions[current].q, answer: val, correct: val === questions[current].a });
  if (val === questions[current].a) {
    score++;
    feedback.textContent = 'Correct!';
  } else {
    feedback.textContent = `Wrong! The answer is ${questions[current].a}`;
  }
  current++;
  setTimeout(showQuestion, 900);
});

tryAgainBtn.addEventListener('click', () => {
  startGame();
});

returnBtn.addEventListener('click', () => {
  window.location.href = 'mingames.html';
});

function saveAttempt() {
  // Get JWT token and send with authenticated user ID
  const token = localStorage.getItem('token');
  if (!token) {
    console.error('No JWT token found');
    return;
  }
  
  fetch('/mathgame/attempt', {
    method: 'POST',
    headers: { 
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${token}`
    },
    body: JSON.stringify({ score, attempts })
  })
  .then(response => {
    if (response.ok) {
      console.log('Math game attempt saved successfully');
    } else {
      console.error('Failed to save math game attempt:', response.status);
    }
  })
  .catch(error => {
    console.error('Error saving math game attempt:', error);
  });
}

startGame();
