ALTER TABLE `jumi_admin` ADD `passwortcode` VARCHAR(255) NULL DEFAULT NULL AFTER `passwort`, ADD `passwortcode_time` TIMESTAMP NULL DEFAULT NULL AFTER `passwortcode`; 
ALTER TABLE `jumi_admin` CHANGE `passwortcode` `passwortcode` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'Passwort vergessen', CHANGE `passwortcode_time` `passwortcode_time` TIMESTAMP NULL DEFAULT NULL COMMENT 'Passwort vergessen'; 


https://forum.chip.de/discussion/663654/firefox-dazu-zwingen-seite-komplett-neu-zu-laden


1. �ffnen Sie Firefox.
2. Geben Sie in der Adresszeile "about:config" ein und klicken Sie auf die "Go"-Schaltfl�che.
3. Suchen Sie �ber die Filter-Zeile nach "cache".
4. Markieren Sie die Zeile "browser.cache.check_doc_frequency".
5. Klicken Sie diese doppelt an oder w�hlen Sie im Kontexten� der Zeile "Bearbeiten".
6. Setzen Sie den Standardwert "3" auf "1".
7. Best�tigen Sie mit "OK".

Folgende Werte stehen zur Verf�gung:

Wert Bedeutung
0 einmal pro Sitzung
1 jedes Mal
2 nie
3 automatisch oder wenn erforderlich