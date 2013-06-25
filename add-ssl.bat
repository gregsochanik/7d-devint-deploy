REM - Hook up an ssl certificate
REM - The SSL_CERT_ID must be a ceritifcate thumbnail stored in the server certiticate cache
REM - The SSL_CERT_APP_ID can be any random GUID, it's just used as an id for this pairing

netsh http add sslcert ipport=0.0.0.0:%SSL_PORT% certhash=%SSL_CERT_ID% appid=%SSL_CERT_APP_ID%
