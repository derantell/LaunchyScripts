param($text)

if(test-path $text) {
    $path = resolve-path $text
    $bytes = [System.IO.File]::ReadAllBytes($path)    
} else {
    $bytes = [System.Text.Encoding]::UTF8.GetBytes($text)    
}

[convert]::ToBase64String($bytes) | clip
