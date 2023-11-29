Get-ChildItem -Path 'C:\Users' -Directory | ForEach-Object {
    $size = (Get-ChildItem -Path $_.FullName -Recurse -File | Measure-Object -Property Length -Sum).Sum
    [PSCustomObject]@{
        Katalog = $_.FullName
        Rozmiar = [Math]::Round($size / 1MB, 2)
    }
} | Sort-Object Rozmiar -Descending