param($text, $algorithm = "MD5")

if(test-path $text) {
    $path = resolve-path $text
    $bytes = [System.IO.File]::ReadAllBytes($path)    
} else {
    $bytes = [System.Text.Encoding]::UTF8.GetBytes($text)    
}

switch($algorithm){
    "SHA1"   {$hasher = [System.Security.Cryptography.SHA1]::Create() }
    "SHA256" {$hasher = [System.Security.Cryptography.SHA256]::Create() }
    "SHA512" {$hasher = [System.Security.Cryptography.SHA512]::Create() }
    default  {$hasher = [System.Security.Cryptography.MD5]::Create() }
}

$hash = [System.BitConverter]::ToString($hasher.ComputeHash($bytes)).Replace("-", "")
$hash | clip
