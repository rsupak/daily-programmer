var clients = {
  0 : ['Accenture', 'ME'],
  1 : ['Acorio', 'AM'],
  2 : ['Aeritae', 'KE'],
  3 : ['Booz Allen', 'EA'],
  4 : ['Bravium', 'MG'],
  5 : ['Buchanan & Edwards', 'JE'],
  6 : ['CACI', 'AF'],
  7 : ['CDI', 'MG'],
  8 : ['CSC Global', 'AF'],
  9 : ['Deloitte', 'ME'],
  10 : ['Discover Technologies', 'ME'],
  11 : ['GDIT', 'ME'],
  12 : ['George Street Inc.', 'JH'],
  13 : ['LMI', 'SP'],
  14 : ['Leidos', 'ME'],
  15 : ['Perspecta', 'ME'],
  16 : ['Raymond James', 'LK'],
  17 : ['ReliaSource', 'AF'],
  18 : ['RoundTower', ''],
  19 : ['Thomas Jefferson DICE', 'SP'],
  20 : ['TripPoint', 'JH'],
  21 : ['Unisys', 'EA'],
  22 : ['USAA', 'EA'],
  23 : ['Wellcare', 'LK'],
  24 : ['Other',''],
}

current.u_client_relationship = clients[parseInt(current.u_client_name.value)][1].toLowerCase();
