const deck = []
function deckCreation() {
  for (let i = 2; i < 15; i++) {
    if (i % 11 === 0) {
      deck.push('Jack of Hearts')
    } else if (i % 12 === 0) {
      deck.push('Queen of Hearts')
    } else if (i % 13 === 0) {
      deck.push('King of Hearts')
    } else if (i % 14 === 0) {
      deck.push('Ace of Hearts')
    } else {
      deck.push(i + ' of Hearts')
    }

  }
  for (let i = 2; i < 15; i++) {
    if (i % 11 === 0) {
      deck.push('Jack of Diamonds')
    } else if (i % 12 === 0) {
      deck.push('Queen of Diamonds')
    } else if (i % 13 === 0) {
      deck.push('King of Diamonds')
    } else if (i % 14 === 0) {
      deck.push('Ace of Diamonds')
    } else {
      deck.push(i + ' of Diamonds')
    }

  } for (let i = 2; i < 15; i++) {
    if (i % 11 === 0) {
      deck.push('Jack of Spades')
    } else if (i % 12 === 0) {
      deck.push('Queen of Spades')
    } else if (i % 13 === 0) {
      deck.push('King of Spades')
    } else if (i % 14 === 0) {
      deck.push('Ace of Spades')
    } else {
      deck.push(i + ' of Spades')
    }

  } for (let i = 2; i < 15; i++) {
    if (i % 11 === 0) {
      deck.push('Jack of Clubs')
    } else if (i % 12 === 0) {
      deck.push('Queen of Clubs')
    } else if (i % 13 === 0) {
      deck.push('King of Clubs')
    } else if (i % 14 === 0) {
      deck.push('Ace of Clubs')
    } else {
      deck.push(i + ' of Clubs')
    }

  }
}

// function shuffle(deck) {
//   for (let i = 0; i < deck.length; i++) {
//     let swappedCard = Math.floor(Math.random() * (i + 1));
//     [deck[i], deck[swappedCard]] = [deck[swappedCard], deck[i]]
//   }
//   return deck
// }

function shuffle(deck, shuffles = 1) {
  while (shuffles > 0) {
    for (let i = 0; i < deck.length; i++) {
      let swappedCard = Math.floor(Math.random() * (i + 1));
      [deck[i], deck[swappedCard]] = [deck[swappedCard], deck[i]]
    }
    shuffles--
  }
  return deck
}

deckCreation()
shuffle(deck)
console.log(deck)
console.log(deck.length)
