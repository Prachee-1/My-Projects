function generateQRCode(){
    var website=document.getElementById('website').value
    if(website){
        let qrcodeconatiner=document.getElementById('qrcode')
        qrcodeconatiner.innerHTML=""
        new QRCode(qrcodeconatiner,website)
        document.getElementById('qrcode-container').style.display="block"

    }
    else{
        alert("Please enter the valid url")
    }
}