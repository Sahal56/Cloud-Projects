// Modal logic
const modal = document.getElementById('modal');
const architectureButton = document.getElementById('architecture-button');
const closeModal = document.getElementById('close-modal');

architectureButton.addEventListener('click', () => {
    modal.style.display = 'flex';
});

closeModal.addEventListener('click', () => {
    modal.style.display = 'none';
});

// Fetch and display games
fetch('./assets/games.json')
    .then(response => response.json())
    .then(data => {
        const gameListContainer = document.getElementById('game-list');

        data.forEach(game => {
            const gameCard = document.createElement('div');
            gameCard.classList.add('game-card');

            const gameImage = document.createElement('img');
            gameImage.src = game.image;
            gameImage.alt = `${game.name} Screenshot`;

            const gameTitle = document.createElement('h2');
            gameTitle.textContent = game.name;

            const gameDescription = document.createElement('p');
            gameDescription.textContent = game.description;

            const playButton = document.createElement('button');
            playButton.classList.add('play-button');
            playButton.textContent = `Play`;
            playButton.addEventListener('click', () => {
                window.open(game.path, '_blank');
            });

            gameCard.appendChild(gameImage);
            gameCard.appendChild(gameTitle);
            gameCard.appendChild(gameDescription);
            gameCard.appendChild(playButton);

            gameListContainer.appendChild(gameCard);
        });
    })
    .catch(error => {
        console.error('Error fetching game data:', error);
    });
