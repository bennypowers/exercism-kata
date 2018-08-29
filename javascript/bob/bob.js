/* eslint-disable no-unused-vars */
import { all } from './lib/utilities.js';

const isAllUpper = str => str === str.toUpperCase();

const hasLetter = str => str.match(/[a-z]/i);

const isQuestion = str => str.endsWith('?');

const nonWhiteSpace = str => !str || str.match(/^[\s]+$/);

const isShouting = all(isAllUpper, hasLetter);

const isForcefulQuestion = all(isShouting, isQuestion)

const responses = {
  EMPTY: 'Fine. Be that way!',
  FORCEFUL_QUESTION: 'Calm down, I know what I\'m doing!',
  SHOUTING: 'Whoa, chill out!',
  QUESTION: 'Sure.',
  DEFAULT: 'Whatever.'
}

class Bob {
  hey(message) {
    const trimmed = message.trim();
    const { DEFAULT, EMPTY, FORCEFUL_QUESTION, QUESTION, SHOUTING } = responses
    return (
        nonWhiteSpace(trimmed) ? EMPTY
      : isForcefulQuestion(trimmed) ? FORCEFUL_QUESTION
      : isShouting(trimmed) ? SHOUTING
      : isQuestion(trimmed) ? QUESTION
      : DEFAULT
    );
  }
}

export default Bob;
