@description('Location for resources')
param location string

@description('Location GeoCode')
param geoCode string

@description('Hub Octet')
param hubOctet int = 1

resource vnetHub 'Microsoft.Network/virtualNetworks@2022-01-01' = {
  name: 'CA-${geoCode}-H01-VNet'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.${hubOctet}.0.0/24'
      ]
    }
  }
}
