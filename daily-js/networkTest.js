var agent = {
  "networkInterfaces": [
  {
      "id": "991921520718590402",
      "inet": [
          "10.5.231.232"
      ],
      "inet6": [],
      "name": "Ethernet 2",
      "physical": "00:05:9a:3c:7a:00"
  },
  {
      "id": "963918552289269090",
      "inet": [
          "192.168.7.33"
      ],
      "inet6": [
          "fe80::11a1:7068:46be:b5c2"
      ],
      "name": "Wi-Fi",
      "physical": "34:f3:9a:9a:0d:44"
  }
]
}
var macAddresses = []

for (var i = 0; i < agent.networkInterfaces.length; i++) {
  macAddresses.push(agent.networkInterfaces[i].name + " : " + agent.networkInterfaces[i].physical)
}

console.log(macAddresses.join(","))

