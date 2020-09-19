let sources = {source1: {energy: 12}, source2: {energy: 10}, source3: {energy: 11}};

const getMaxEnergy = sources => {
  let max_energy = 0;
  let max_source = null;
  for (let source in sources) {
    console.log(source)
    // if (source.energy >= max_energy) {
    //   max_source = source;
    //   console.log(max_source)
    //   max_energy = source.energy;
    // }
  }
  return max_source;
}

console.log(getMaxEnergy(sources));
