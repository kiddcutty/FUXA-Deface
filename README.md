# FUXA-Deface  

## Steps for attack
1. Start a local http server on attacker box.
```python3 -m http.server```
2. Run shell script on attacker machine in another terminal window.
```./fuxa-deface.sh```
3. Enter target URL for FUXA instance (e.g. ```http://192.18.48.50:1881```)
4. Enter attacker HTTP server URL with malicious HTML file (e.g. ```192.168.10.10/deface.html```) HTML file included in package but you can use your own.
5. The script should replace the default ```index.html``` file with ```deface.html```.
6. Navigate to FUXA instance and you should now get defacement page.
