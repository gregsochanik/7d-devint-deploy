%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -file last-pinned-from-tc.ps1

CALL ./deploy-service.cmd prod-extapp01.win.sys.7d prod D:/inetpub/7d-artgrab/

CALL ./try-uninstall-service.cmd prod-extapp01.win.sys.7d prod ArtGrab SevenDigital.ArtGrab.exe D:/inetpub/7d-artgrab/

CALL ./unpack-service.cmd prod-extapp01.win.sys.7d prod D:/inetpub/7d-artgrab/ site.zip

CALL ./install-service.cmd prod-extapp01.win.sys.7d prod SevenDigital.ArtGrab.exe D:/inetpub/7d-artgrab/



