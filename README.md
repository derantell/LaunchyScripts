# LaunchyScripts

Some scripts that can be invoked via [Launchy](http://www.launchy.net/) to help with some tasks.

Put them in a directory and add that directory to Launchy's catalog. To invoke a script via Launcy, start writing the name of the script. When the script is found press tab to add arguments. Quote arguments that contains spaces.

All the scripts use a .cmd file to bootstrap powershell. Output is placed on the clipboard.

Inspired by [Whitson Gordon's Launchy article on Lifehacker](http://www.lifehacker.com.au/2012/11/why-you-should-be-using-an-app-launcher/).

## Base64

This script encodes its input using [base64 encoding](http://en.wikipedia.org/wiki/Base64). 

First the script tests whether the input is a path to an existing file. If that is the case, the file content is base64  encoded and the result is put on the clipboard. If the input is not a file the input text is encoded as is. 

	base64 > c:\temp\myfile.txt

This command sets content of the clipboard to the base64 encoded content of the file.

	base64 > "Lorem ipsum dolor sit amet"

The above command encodes the UTF-8 encoding of the string and puts the result on the clipboard.

## Hash

Hashes its input using a specific hash algorithm, MD5 as default. The HEX encoded hash value is placed on the clipboard.

Just like the Base64 script, this script tests whether its first argument is a path to an existing file and hashes the file if that is the case. The second argument to the script tells which algorithm to use. Valid values are `MD5`, `SHA1`, `SHA256` or `SHA512`, with MD5 as the default value if the argument is not used.

	hash > c:\temp\foo.jpg sha1

Places the SHA1 hash of the image on the clipboard. 

## Slugify

Creates an [URL-friendly slug](http://en.wikipedia.org/wiki/Slug_%28web_publishing%29#Slug) of its argument.

	slugify > "Señor Dvořák payed €20 for his Motörhead tickets"

Results in the slug `senor-dvorak-payed-20-for-his-motorhead-tickets`. See [URL Slugify alrogithm [sic] in C#?](http://stackoverflow.com/questions/2920744/url-slugify-alrogithm-in-c) on stackoverflow for the algorithm used. Especially the code for removing [diacritics](http://en.wikipedia.org/wiki/Diacritic) is worth a look. Black magic, I tell you!

## Urlencode

Makes a string valid for use in an URL by [percent encoding](http://en.wikipedia.org/wiki/Percent-encoding) its argument.

	urlencode > http://en.wikipedia.org/wiki/Percent-encoding

Results in the string `http%3a%2f%2fen.wikipedia.org%2fwiki%2fPercent-encoding`.
