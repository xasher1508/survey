<?php
function cryption($hash, $method)
{
    // Method e=encrypt, d=decrypt
    // Store the cipher method 
    # Für PHP 7.1 noch 128
    $ciphering = "AES-128-CTR";
    
    
    // Use OpenSSl Encryption method 
    $iv_length = openssl_cipher_iv_length($ciphering);
    $options   = 0;
    
    // Store the encryption key 
    $key = "!O3JoDLnBI6#[M%4S!sZH1zU0?8+5C_!}";
    
    // Non-NULL Initialization Vector for encryption 
    $vector = '0843413489572156';
    
    if ($method == 'e') {
        // Use openssl_encrypt() function to encrypt the data 
        $encryption = openssl_encrypt($hash, $ciphering, $key, $options, $vector);
        return $encryption;
    }
    // Store a string into the variable which 
    // need to be Encrypted 
    
    
    if ($method == 'd') {
        // Use openssl_decrypt() function to decrypt the data 
        $decryption = openssl_decrypt($hash, $ciphering, $key, $options, $vector);
        
        # kryptische Returnwerte bei falschem String entfernen: Nur Zahlen und Buchstaben
        #$decryption = preg_replace('![^0-9a-zA-Z]!', '', $decryption);
        
        # https://stackoverflow.com/questions/1176904/php-how-to-remove-all-non-printable-characters-in-a-string
        $decryption = preg_replace('/[\x00-\x1F\x7F-\xFF]/', '', $decryption);
        
        return $decryption;
    }
}
#$crypt = cryption("!DWdMiU#", 'e');
#echo $crypt;
#echo "<br>";
#echo cryption($crypt, 'd');
?> 