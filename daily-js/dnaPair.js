
function pairElement(str) {
  let dnaStrand = [];
  let basePair = str.split('');
  for (let indexOfBase of basePair) {
    const dnaPairs = {
       "A": ["A", "T"],
       "C": ["C", "G"],
       "G": ["G", "C"],
       "T": ["T", "A"],
    }
    dnaStrand.push( dnaPairs[indexOfBase] )
  }
  return dnaStrand;
}

console.log(pairElement("GCG"));
