

@description('Location for all resources.')
param location string = 'centralus'

var regions = loadJsonContent('../../variables/regions.json')
var geoCode = toUpper(regions[toLower(location)].geoCode)

targetScope='subscription'

resource rgHub 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: 'CA-${geoCode}-H01-Network-RG'
  location: location
}

module network 'network.bicep' = {
  name: 'Deployment-Network'
  scope: rgHub
  params: {
    location: rgHub.location
    geoCode: geoCode    
  }
}
