# Tag Cloud
Animated Tag Cloud for UniversalDashboard

## Reason For This Component
Although I am the dashboard guy at work now, I never get any clues as what to actually put on pages to make them look good.
Having seen various terms being used I found this:- https://www.npmjs.com/package/d3-tagcloud-for-react
This seemed like an ideal way to style any page, and would be good for demonstrations or presentations

## Inspiration
I saw a blog posted on twitter a while back right here in fact:- 
https://ridicurious.com/2019/12/18/powershell-web-search-and-generating-world-cloud-from-results/
Well I thought this looked pretty cool, but seemed a big effort to get the result. Plus it wasn't animated.

## Parameters
          * height
          * padding 
          * fontFamily
          * rotate
          * colorarray
          * data
          * fontSize
          * spiral
          
## Demo

```
Import-Module -Name UniversalDashboard
Import-Module -Name UniversalDashboard.UDTagCloud
Get-UDDashboard | Stop-UDDashboard
$theme = New-UDTheme -Name "Basic" -Definition @{
    'main' = @{
        'padding-left'   = "5px"
        'padding-right'  = "5px"
        'padding-top'    = "5px"
        'padding-bottom' = "5px"
    }
} -Parent "Default"
Start-UDDashboard -Port 1000 -AutoReload -Dashboard (
    New-UDDashboard -Title "Powershell UniversalDashboard" -Theme $theme -Content {
        New-UDRow -Columns {
            New-UDColumn -Size 4 -Content {
                $words = "Powershell", "UniversalDashboard", "Conference", "June 2020", "Adam Driscoll", "Animation", "Dashboards", "Stylish", "Beautiful", "Amazing", "Web Framework", "User Interface", "Europe", "#PSConf"
                $hash = @()
                foreach ($item in $words) {
                    $hash += @{
                        label    = $item
                        fontSize = $(Get-Random -Maximum 5 -Minimum 1)
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
```
 
