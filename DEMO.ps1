Import-Module -Name UniversalDashboard
Import-Module -Name UniversalDashboard.UDCloudTag
Get-UDDashboard | Stop-UDDashboard
$theme = Get-UDTheme -Name Default
Start-UDDashboard -Port 1000 -AutoReload -Dashboard (
    New-UDDashboard -Title "Powershell UniversalDashboard" -Theme $theme -Content {
        New-UDRow -Columns {
            New-UDColumn -Size 12 -Content {
                $words = "Powershell", "UniversalDashboard", "Conference", "June 2020", "Adam Driscoll", "Animation", "Dashboards", "Stylish", "Beautiful", "Amazing", "Web Framework", "User Interface", "Europe", "#PSConf"
                $hash = @()
                foreach ($item in $words) {
                    $hash += @{
                        label    = $item
                        fontSize = $(Get-Random -Maximum 15 -Minimum 1)
                        opacity  = $(Get-Random -Maximum 10 -Minimum 3)
                    }
                }

                New-UDTagCloud -data { $hash } -rotate 0 -padding 7 -height "400px" -spiral 3 -colorarray @('#3772ff',
                    '#df2935',
                    '#fdca40',
                    '#09e85e',
                    '#16c172',
                    '#172a3a',
                    '#004346',
                    '#fa7921',
                    '#fe9920',
                    '#0c4767')

            }
        }
    }
)
