Install-WindowsFeature DNS -IncludeManagementTools
Set-DnsServerForwarder -IPAddress "168.63.129.16"