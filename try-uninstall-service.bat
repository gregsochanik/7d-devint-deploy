net stop \"%SERVICE_NAME%\" | echo

timeout /T 5

C:/Windows/Microsoft.NET/Framework/v4.0.30319/InstallUtil -u  %ROOT%%ENV_NAME%/%SERVICE_FILE_NAME%
