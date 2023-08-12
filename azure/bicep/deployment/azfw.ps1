Connect-AzAccount

Set-AzContext -Subscription "a0db544f-153c-4da2-a43d-e2e947dc7be6"

$deployVars = @{
    Name                = "CA-H01-Network"
    Location            = "centralus"
    TemplateFile        = "../modules/azfw_hub/main.bicep"
    DenySettingsMode    = "none"
}

$deploy = New-AzSubscriptionDeploymentStack @deployVars
