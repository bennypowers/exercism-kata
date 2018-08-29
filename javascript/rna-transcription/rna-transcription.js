// transcribe :: a -> a
const transcribe = base => {
	switch(base) {
		case 'G': return 'C';
		case 'C': return 'G';
		case 'T': return 'A';
		case 'A': return 'U';
		default: throw new Error('Invalid input DNA.');
	}
}

export default class DnaTranscriber {
	toRna(sequence) {
		return [...sequence.toUpperCase()]
			.map(transcribe)
			.join('');
	}
}
