const CryptoJS = require('crypto-js');

const key = Buffer.from("01234567890123456789012345678901");
const iv = Buffer.from("0123456789012345");



const AES_KEY = '1c012b9c8aa74363aa541b8080e886e0';
const AES_IV = '080aae32c79b49bf';


const encrypt = (plainText) => {
  var key = CryptoJS.enc.Utf8.parse(AES_KEY);
  var iv = CryptoJS.enc.Utf8.parse(AES_IV);

  console.log("IV (Base64):", CryptoJS.enc.Base64.stringify(iv));
  var cipherText = CryptoJS.AES.encrypt(plainText, key, {
    iv: iv,
  });

  return cipherText.toString();
};

const decrypt = (cipherText) => {
  var key = CryptoJS.enc.Utf8.parse(AES_KEY);
  var iv = CryptoJS.enc.Utf8.parse(AES_IV);
  var decrypted = CryptoJS.AES.decrypt({ ciphertext: CryptoJS.enc.Base64.parse(cipherText) }, key, {
    iv: iv,
    mode: CryptoJS.mode.CBC,
    padding: CryptoJS.pad.Pkcs7,
  });
  console.log("Decrypted:", decrypted);
  console.log(decrypted.toString(CryptoJS.enc.Utf8));
  if (decrypted.sigBytes <= 0) {
    console.error('Decryption failed: Invalid ciphertext or key/IV');
    return null;
  }

  return decrypted.toString(CryptoJS.enc.Utf8);
};

module.exports = { encrypt, decrypt };