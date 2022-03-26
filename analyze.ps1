
$NDKPath = $env:ANDROID_NDK_HOME

$stackScript = "$NDKPath/ndk-stack"
if (-not ($PSVersionTable.PSEdition -eq "Core")) {
    $stackScript += ".cmd"
}
$filename = $args[0]
Get-Content $filename | & $stackScript -sym ./build/debug/ > "$($filename)_unstripped.txt"
& code "$($filename)_unstripped.txt"