

const sumOfFirst100K =
			last(
				runningTotal(
					takeWhileLessThan(
						1000000,
						oddOnly(fibonacciSequence())
					)
				)
			)
console.log(sumOfFirst100K)


// Generate an infinite fibonacci sequence
// Remember that it will only actually run when next() is called
// and will only run until the next yield and then wait for next() again
function * fibonacciSequence() {
	let twoAgo = 0
	let oneAgo = 1
	while(true) {
		const current = twoAgo + oneAgo
		twoAgo = oneAgo
		oneAgo = current
		yield current
	}
}

//examine one at a time and only yield back the odd ones
function * oddOnly(sequence) {
	for(let n of sequence)
		if(n % 2 === 1)
			yield n
}

//A way of limiting how many we take, at some point shouldContinue
//will return false and we will stop iterating/calling next()
function * takeWhile(sequence, shouldContinue) {
	for(let x of sequence) {
		if(!shouldContinue(x))
			return
		yield x
	}
}
function * takeWhileLessThan(max, sequence) { //just a helper
	yield * takeWhile(sequence, x => x < max)
}

//As you iterate numbers, sum them and generate a new list of the running total
function * runningTotal(sequence) {
	let total = 0
	for(let n of sequence) {
		total += n
		yield total
	}
}

//Just get the last value of a sequence
function last(sequence) {
	let v
	for(v of sequence) {} //don't do anything, just run through the sequence
	return v
}
