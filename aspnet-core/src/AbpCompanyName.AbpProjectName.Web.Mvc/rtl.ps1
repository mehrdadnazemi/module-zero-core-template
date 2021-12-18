Clear-Host

if (-NOT (Get-Command npx -errorAction SilentlyContinue)) {
    "NPX doesn't exists"
    exit(1);
}

$PATH = Read-Host 'What is your path?'

Write-Host Making RTL direction to all of css files...

Get-ChildItem $PATH -Filter *.css -recurse | Foreach-Object {
    $fileName = $_.FullName
    if ($fileName -notlike "*.rtl*") {
        npx rtlcss $fileName "$fileName + ".rtl.css""
        Write-Host $fileName
    }
}

Write-Host -NoNewline All css files of folder have been successfully made RTL.
Write-Host Press any key to exit.
pause