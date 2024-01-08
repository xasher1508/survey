<?php
header("content-type: text/html; charset=utf-8");
#-------------- Globale Konfiguration, nicht Ã¤ndern -----------------------------
$smarty->assign('global_titel', "Administration JU & MI");
##$smarty->assign('global_service_admin', "$global_service_admin");
##$smarty->assign('global_service_mail', "$global_service_mail");
#$smarty->assign('global_template', "$template");
#-------------- Globale Konfiguration beendet, Ã„nderungen ab hier ---------------

# titel.html
$smarty->assign('titel_head_umfrage', "Umfragen");
$smarty->assign('titel_head_admin', "Administration");


# menu_servey.html
$smarty->assign('menu_survey_head1', "Umfragen");
$smarty->assign('menu_survey_head1_sub1', "Umfrage erstellen");

# hauptframe.html
#$smarty->assign('hauptframe_text1', "Hallo und herzlich Willkommen zur Deputatverwaltung");
#$smarty->assign('hauptframe_text2', "Bitte treffen Sie im Men&uuml; Ihre Auswahl");

# hauptframe_eingabe.html
#$smarty->assign('hauptframe_eingabe_titel', "Eingabebereich");
#$smarty->assign('hauptframe_eingabe_text1', "Hallo und Herzlich Willkommen zur Deputatverwaltung");
#$smarty->assign('hauptframe_eingabe_text2', "Im Eingabebereich k&ouml;nnen Sie einen Deputate erfassen!");


# hauptframe_admin.html
#$smarty->assign('hauptframe_admin_titel', "Adminbereich");
#$smarty->assign('hauptframe_admin_text1', "Hallo und Herzlich Willkommen zur Deputatverwaltung!");
#$smarty->assign('hauptframe_admin_text2', "Im Adminbereich k&ouml;nnen Sie Deputate bearbeiten!");

# erfassen_eingabe.html
#$smarty->assign('erf_titel', "Deputat erfassen");


# abschlussarbeiten.html
#$smarty->assign('abschluss_titel', "Abschlussarbeiten erfassen");

# jahresabschluss.html
#$smarty->assign('jaabschl_titel', "Jahresabschluss");

# erfassen_sonstige.html
#$smarty->assign('erfs_titel', "Sonstige Deputate");


# edit_administratoren.html
#$smarty->assign('access_titel', "Dozenten hinzufügen");
#$smarty->assign('access_mitgl_ausw', "Dozenten auswählen:");

# rollen.html
#$smarty->assign('rollen_titel', "Rollen / Rechte");
#$smarty->assign('rollen_field_auswahl', "Bitte w&auml;hlen Sie eine Rolle aus:");
#$smarty->assign('rollen_field_neu', "Oder erfassen Sie eine neue Rolle:");
#$smarty->assign('rollen_field_bez', "Rollenname");
#$smarty->assign('rollen_mandatory_haupt_titel', "Pflichtfelder ausf&uuml;llen");
#$smarty->assign('rollen_mandatory_haupt_text', "Bitte w&auml;hlen Sie eine Rolle!");
#$smarty->assign('rollen_invalid_haupt_titel', "Nur eine Option w&auml;hlen");
#$smarty->assign('rollen_invalid_haupt_text', "Bitte f&uuml;llen Sie entweder das Textfeld aus oder w&auml;hlen einen Eintrag aus dem Dropdownfeld.");
#$smarty->assign('rollen_admin_titel', "Rollenadminisration");
#$smarty->assign('rollen_admin_text', "Hier k&ouml;nnen Sie die Rolle administrieren. (Rechte zuweisen, bearbeiten, l&ouml;schen)");
#$smarty->assign('rollen_field_bez', "Bezeichnung");
#$smarty->assign('rollen_field_ren', "Umbenennen");
#$smarty->assign('rollen_field_del', "L&ouml;schen");
#$smarty->assign('rollen_field_zuw', "Rechte zuweisen");
#$smarty->assign('rollen_field_inforights', "Info Rechte");
#$smarty->assign('rollen_field_ben_zuw', "Benutzer zuweisen");
#$smarty->assign('rollen_field_infouser', "Info Benutzer");
#$smarty->assign('rollen_field_info_ohnerolle', "Benutzer ohne Rolle");
#$smarty->assign('rollen_edit_titel', "Rolle bearbeiten");
#$smarty->assign('rollen_edit_field_bez', "Rollenname");
#$smarty->assign('rollen_rechte_titel', "Rechte zuweisen");
#$smarty->assign('rollen_rechte_subtitel', "Mehrfachauswahl mit Strg-Taste");
#$smarty->assign('rollen_user_titel', "Benutzer zuweisen");
#$smarty->assign('rollen_user_subtitel', "Mehrfachauswahl mit Strg-Taste");
#$smarty->assign('rollen_user_titel2', "Benutzer der Rolle");


# kat_anrede.html
#$smarty->assign('anrede_titel', "Katalog Anrede bearbeiten");
#$smarty->assign('anrede_edit_titel', "Anredebezeichnung eingeben");
#$smarty->assign('anrede_edit_desc_new', "Neue Anredebezeichnung eingeben");
#$smarty->assign('anrede_edit_desc_exist', "Anredebezeichnung ändern");

# jahrgang.html
#$smarty->assign('jahrgang_titel', "Studienjahr w&auml;hlen");

# erf_fz.html
#$smarty->assign('fz_titel', "Funktionsübernahme");
#$smarty->assign('fz_edit_titel', "Anredebezeichnung eingeben");
#$smarty->assign('fz_edit_desc_new', "Neue Anredebezeichnung eingeben");
#$smarty->assign('fz_edit_desc_exist', "Anredebezeichnung ändern");
#$smarty->assign('fz_field_starttag', "Beginn der Zulage");
#$smarty->assign('fz_field_endtag', "Ende der Zulage");
#$smarty->assign('fz_field_betrag', "Deputatsermäßigung/Jahr");
#$smarty->assign('fz_field_prof', "Professor");
#$smarty->assign('fz_field_name', "Name");
#$smarty->assign('fz_field_aktionen', "Aktionen");
#$smarty->assign('fz_save_titel', "Speicherung");
#$smarty->assign('fz_save_text', "Der Betrag wurde gespeichert!");









#---------------
# hauptframe_ausschuss.html
#$smarty->assign('hauptframe_ausschuss_titel', "Ausschussbereich");
#$smarty->assign('hauptframe_ausschuss_text1', "Hallo und Herzlich Willkommen zur Deputatverwaltung!");
#$smarty->assign('hauptframe_ausschuss_text2', "Im Ausschussbereich k&ouml;nnen Sie &uuml;ber Gutachterbenennungen entscheiden!");

# hauptframe_beteiligte.html
#$smarty->assign('hauptframe_beteiligte_titel', "Beteiligtenbereich");
#$smarty->assign('hauptframe_beteiligte_text1', "Hallo und Herzlich Willkommen zur Deputatverwaltung!");
#$smarty->assign('hauptframe_beteiligte_text2', "Im Beteiligtenbereich k&ouml;nnen Sie eine Stellungnahme &uuml;ber Deputate abgeben!");

# hauptframe_gutachter.html
#$smarty->assign('hauptframe_gutachter_titel', "Gutachterbereich");
#$smarty->assign('hauptframe_gutachter_text1', "Hallo und Herzlich Willkommen zur Deputatverwaltung!");
#$smarty->assign('hauptframe_gutachter_text2', "Im Gutachterbereich k&ouml;nnen Sie eine Stellungnahme &uuml;ber Deputate abgeben!");


# erfassen_eingabe.html
#$smarty->assign('erfassen_eingabe_titel', "Verbesserungsvorschlag erfassen");
#$smarty->assign('erfassen_eingabe_mandatory_text', "Es ist zu einem Fehler gekommen. Bitte f&uuml;llen Sie alle Pflichtfelder aus.");
#$smarty->assign('erfassen_eingabe_field_ersteller', "Ersteller/Ansprechpartner:");
#$smarty->assign('erfassen_eingabe_field_mailadresse', "Mailadresse:");
#$smarty->assign('erfassen_eingabe_field_gruppe', "Gruppenzugeh&ouml;rigkeit:");
#$smarty->assign('erfassen_eingabe_field_gruppenmitglieder', "Weitere Ersteller (bei Gruppenvorschlag):");
#$smarty->assign('erfassen_eingabe_field_betreff', "Betreff:");
#$smarty->assign('erfassen_eingabe_field_beschreibung', "Situationsbeschreibung:");
#$smarty->assign('erfassen_eingabe_field_vorschlag', "Verbesserungsvorschlag und konkreter Umsetzungsplan:");
#$smarty->assign('erfassen_eingabe_field_nutzen', "Nutzen des Verbesserungsvorschlages:");
#$smarty->assign('erfassen_eingabe_checkbox_public', "Der Verbesserungsvorschlag darf nach Abschluss ver&ouml;ffentlicht werden:");
#$smarty->assign('erfassen_eingabe_checkbox_ldsg', "Hinsichtlich Ihrer pers&ouml;nlichen Daten weisen wir gem&auml;&szlig; &sect;14 LDSG darauf hin, dass diese nach Ma&szlig;gabe der anwendbaren Datenschutzbestimmungen verarbeitet werden. Die von Ihnen in diesem Eingabeformular eingegeben pers&ouml;nlichen Daten werden nur zum Zweck des Ideenmanagements vom Qualit&auml;tsmanagement-Beauftragten der Hochschule Ludwigsburg f&uuml;r &ouml;ffentliche Verwaltung und Finanzen verwendet. Ihr Verbesserungsvorschlag wird vor der Weitergabe anonymisiert. Eine Weitergabe der in diesem Kontaktformular &uuml;bermittelten pers&ouml;nlichen Daten an Dritte findet nur im Rahmen der \"Gemeinsamen Verwaltungsvorschrift der Ministerien &uuml;ber die Auszeichnung von Vorschl&auml;gen zur Verbesserung der Landesverwaltung\" statt. Nach &sect; 21 LDSG haben Sie das Recht, bei der Hochschule Auskunft &uuml;ber die zu Ihrer Person gespeicherten Daten zu beantragen und / oder unrichtig gespeicherte Daten berichtigen zu lassen.<br />Ich bin mit dieser Verarbeitung der Daten einverstanden:<br /><strong>(bitte ankreuzen, ansonsten kann keine weitere Bearbeitung stattfinden)</strong>");
#$smarty->assign('erfassen_eingabe_abgeschlossen_titel', "Erfassen abgeschlossen");
#$smarty->assign('erfassen_eingabe_abgeschlossen_text1', "Der Verbesserungsvorschlag wurde eingereicht");
#$smarty->assign('erfassen_eingabe_abgeschlossen_text2', "ID des Vorschlages:");

# gruppenmitglieder.html
#$smarty->assign('gruppenmitglieder_eingabe_titel', "Gruppenmitglieder erfassen");

# logout.html
#$smarty->assign('logout_titel', "Logout");
#$smarty->assign('logout_text', "Der Logout ist abgeschlossen!");

# menu.html
#$smarty->assign('menu_administrator', "Administration");
#$smarty->assign('menu_profil', "Profil");

# passwort_vergessen.html
#$smarty->assign('passwort_vergessen_titel', "Zugangsdaten beantragen");
#$smarty->assign('passwort_vergessen_text1', "Sie k&ouml;nnen hier neue Zugangsdaten beantragen. Dazu m&uuml;ssen Sie Ihre Mailadresse eingeben, die im System hinterlegt ist. Sie bekommen dann eine Mail mit weiteren Anweisungen!");
#$smarty->assign('passwort_vergessen_field_mail', "Ihre registrierte Mailadresse:");
#$smarty->assign('passwort_vergessen_anfordern_titel', "Passwortanforderung");
#$smarty->assign('passwort_vergessen_anfordern_text', "Sie erhalten in K&uuml;rze eine Mail. Dort finden Sie ein Link, mit dem Sie das Passwort zur&uuml;cksetzen k&ouml;nnen.<br />Erhalten Sie keine Mail kontrollieren Sie bitte Ihren Spam-Ordner Ihres Mailaccounts.");
#$smarty->assign('passwort_vergessen_keinanfordern_titel', "Passwortanforderung nicht erfolgreich");
##$smarty->assign('passwort_vergessen_keinanfordern_text', "Die Passwortanforderung war leider nicht erfolgreich. Setzen Sie sich bitte mit <a href=\"mailto:".$global_service_mail."?subject=Fehler%20bei%20Aktivierung\">".$global_service_admin."</a> in Verbindung");
#$smarty->assign('passwort_vergessen_erfolg_titel', "Zugangsdaten zur&uuml;ckgesetzt");
#$smarty->assign('passwort_vergessen_erfolg_text', "Ihre Zugangsdaten wurden zur&uuml;ckgesetzt.<br />Sie erhalten eine Mail mit den neuen Zugangsdaten");
#$smarty->assign('passwort_vergessen_keinerfolg_titel', "Zugangsdaten nicht zur&uuml;ckgesetzt");
##$smarty->assign('passwort_vergessen_keinerfolg_text', "Ihre Zugangsdaten wurden <strong>nicht</strong> zur&uuml;ckgesetzt.<br />Setzen Sie sich bitte mit <a href=\"mailto:".$global_service_mail."?subject=Fehler%20bei%20Anforderung%20neuer%20Zugangsdaten\">".$global_service_admin."</a> in Verbindung");

# bearbeiten.html
#$smarty->assign('bearbeiten_titel', "Verbesserungsvorschlag bearbeiten");
#$smarty->assign('bearbeiten_err_titel', "Fehlerhafte ID");
#$smarty->assign('bearbeiten_err_text', "Die ID ist im System nicht vorhanden");

# edit.html
#$smarty->assign('edit_titel', "Verbesserungsvorschlag bearbeiten");
#$smarty->assign('edit_field_id', "ID:");
#$smarty->assign('edit_field_ersteller', "Ersteller/Ansprechpartner:");
#$smarty->assign('edit_field_mailadresse', "Mailadresse:");
#$smarty->assign('edit_field_gruppe', "Gruppenzugeh&ouml;rigkeit:");
#$smarty->assign('edit_field_gruppenmitglieder', "Weitere Ersteller (bei Gruppenvorschlag):");
#$smarty->assign('edit_field_betreff', "Betreff:");
#$smarty->assign('edit_field_beschreibung', "Situationsbeschreibung:");
#$smarty->assign('edit_field_vorschlag', "Verbesserungsvorschlag und konkreter Umsetzungsplan:");
#$smarty->assign('edit_field_nutzen', "Nutzen des Verbesserungsvorschlages:");
#$smarty->assign('edit_field_public', "Ver&ouml;ffentlichung nach Abschluss:");
#$smarty->assign('edit_field_hinweiseigen', "Hinweis Erfasser:");
#$smarty->assign('edit_field_hinweisadmin', "Hinweis Admin:");
#$smarty->assign('edit_field_category', "Kategorie:");
#$smarty->assign('edit_field_status', "Status:");
#$smarty->assign('edit_field_ausschlgrund', "Ausschlussgrund:");
#$smarty->assign('edit_field_entschiedengrund', "Schlie&szlig;grund:");
#$smarty->assign('edit_mandatory_text', "Es ist zu einem Fehler gekommen. Bitte f&uuml;llen Sie alle Pflichtfelder aus.");
#$smarty->assign('edit_checkbox_public', "Der Verbesserungsvorschlag darf nach Abschluss ver&ouml;ffentlicht werden:");
#$smarty->assign('edit_checkbox_ldsg', "Hinsichtlich Ihrer pers&ouml;nlichen Daten weisen wir gem&auml;&szlig; &sect;14 LDSG darauf hin, dass diese nach Ma&szlig;gabe der anwendbaren Datenschutzbestimmungen verarbeitet werden. Die von Ihnen in diesem Eingabeformular eingegeben pers&ouml;nlichen Daten werden nur zum Zweck des Ideenmanagements von der Qualit&auml;tsmanagement-Beauftragten der Hochschule Ludwigsburg f&uuml;r &ouml;ffentliche Verwaltung und Finanzen verwendet. Ihr Verbesserungsvorschlag wird vor der Weitergabe anonymisiert. Eine Weitergabe der in diesem Kontaktformular &uuml;bermittelten pers&ouml;nlichen Daten an Dritte findet nur im Rahmen der \"Gemeinsamen Verwaltungsvorschrift der Ministerien &uuml;ber die Auszeichnung von Vorschl&auml;gen zur Verbesserung der Landesverwaltung\" statt. Nach &sect; 21 LDSG haben Sie das Recht, bei der Hochschule Auskunft &uuml;ber die zu Ihrer Person gespeicherten Daten zu beantragen und / oder unrichtig gespeicherte Daten berichtigen zu lassen.<br />Ich bin mit dieser Verarbeitung der Daten einverstanden:<br /><strong>(bitte ankreuzen, ansonsten kann keine weitere Bearbeitung stattfinden)</strong>");
#$smarty->assign('edit_field_datum', "Datum");
#$smarty->assign('edit_field_status', "Status");
#$smarty->assign('edit_abgeschlossen_titel', "Erfassen abgeschlossen");
#$smarty->assign('edit_abgeschlossen_text1', "Der Verbesserungsvorschlag wurde eingereicht");
#$smarty->assign('edit_abgeschlossen_text2', "ID des Vorschlages:");
#$smarty->assign('edit_ablehnen_bttn_text', "Sofortausschluss");
#$smarty->assign('edit_ablehnung_field_begruendung', "Begr&uuml;ndung der Ablehnung");
#$smarty->assign('edit_ablehnung_titel', "Vorschlag abgelehnt");
#$smarty->assign('edit_ablehnung_text', "Der Vorschlag wurde abgelehnt.<br />Der Einreicher wird informiert!");

#gutachterbenennung.html
#$smarty->assign('gutachterbenennung_text1', "Bisher benannte Gutachter:");
#$smarty->assign('gutachterbenennung_field_name', "Name");
#$smarty->assign('gutachterbenennung_field_frist', "Ausschussfrist");
#$smarty->assign('gutachterbenennung_field_frist_abgabe', "Abgabefrist Gutacher");
#$smarty->assign('gutachterbenennung_field_status', "Status");
#$smarty->assign('gutachterbenennung_field_aktionen', "Aktionen");
#$smarty->assign('gutachterbenennung_ldap1_field_suche', "Suchbegriff:");
#$smarty->assign('gutachterbenennung_ldap1_field_pfad', "Suchpfad:");
#$smarty->assign('gutachterbenennung_ldap1_text1', "Es k&ouml;nnen auch nur Teile des Begriffs eingegeben werden: Henz*");
#$smarty->assign('gutachterbenennung_ldap2_field_auswahl', "Auswahl");
#$smarty->assign('gutachterbenennung_ldap2_field_uid', "Benutzerkennung");
#$smarty->assign('gutachterbenennung_ldap2_field_name', "Name");
#$smarty->assign('gutachterbenennung_ldap2_field_gruppe', "Gruppe");
#$smarty->assign('gutachterbenennung_ldap2_field_mail', "Mail");
#$smarty->assign('gutachterbenennung_ldap3_field_vorname', "Vorname:");
#$smarty->assign('gutachterbenennung_ldap3_field_nachname', "Nachname:");
#$smarty->assign('gutachterbenennung_ldap3_field_mail', "Mail:");
#$smarty->assign('gutachterbenennung_ldap3_field_beziehung', "Beziehung zur Hochschule:");
#$smarty->assign('gutachterbenennung_ldap3_field_ag', "AG");
#$smarty->assign('gutachterbenennung_ldap3_field_jahrgang', "Jahrgang:");
#$smarty->assign('gutachterbenennung_ldap3_field_fakultaet', "Fakult&auml;t:");
#$smarty->assign('gutachterbenennung_frist_field_fristdat', "Fristdatum:");
#$smarty->assign('gutachterbenennung_frist_field_bemerk', "Zusatzbemerkung:");
#$smarty->assign('gutachterbenennung_frist2_text1', "Gutachterbenennung abgeschlossen!");


#beteiligtenbenennung.html
#$smarty->assign('beteiligtenbenennung_text1', "Bisher benannte Beteiligte:");
#$smarty->assign('beteiligtenbenennung_field_name', "Name");
#$smarty->assign('beteiligtenbenennung_field_frist', "Frist");
#$smarty->assign('beteiligtenbenennung_field_status', "Status");
#$smarty->assign('beteiligtenbenennung_field_aktionen', "Aktionen");
#$smarty->assign('beteiligtenbenennung_ldap1_field_suche', "Suchbegriff:");
#$smarty->assign('beteiligtenbenennung_ldap1_field_pfad', "Suchpfad:");
#$smarty->assign('beteiligtenbenennung_ldap1_text1', "Es k&ouml;nnen auch nur Teile des Begriffs eingegeben werden: Henz*");
#$smarty->assign('beteiligtenbenennung_ldap2_field_auswahl', "Auswahl");
#$smarty->assign('beteiligtenbenennung_ldap2_field_uid', "Benutzerkennung");
#$smarty->assign('beteiligtenbenennung_ldap2_field_name', "Name");
#$smarty->assign('beteiligtenbenennung_ldap2_field_gruppe', "Gruppe");
#$smarty->assign('beteiligtenbenennung_ldap2_field_mail', "Mail");
#$smarty->assign('beteiligtenbenennung_ldap3_field_vorname', "Vorname:");
#$smarty->assign('beteiligtenbenennung_ldap3_field_nachname', "Nachname:");
#$smarty->assign('beteiligtenbenennung_ldap3_field_mail', "Mail:");
#$smarty->assign('beteiligtenbenennung_ldap3_field_beziehung', "Beziehung zur Hochschule:");
#$smarty->assign('beteiligtenbenennung_ldap3_field_ag', "AG");
#$smarty->assign('beteiligtenbenennung_ldap3_field_jahrgang', "Jahrgang:");
#$smarty->assign('beteiligtenbenennung_ldap3_field_fakultaet', "Fakult&auml;t:");
#$smarty->assign('beteiligtenbenennung_frist_field_fristdat', "Fristdatum:");
#$smarty->assign('beteiligtenbenennung_frist_field_bemerk', "Zusatzbemerkung:");
#$smarty->assign('beteiligtenbenennung_frist2_text1', "Beteiligtenbenennung abgeschlossen!");



# erfassen_status.html
#$smarty->assign('erfassen_status_titel', "Status");
#$smarty->assign('erfassen_status_err_titel', "Fehlerhafte ID");
#$smarty->assign('erfassen_status_err_text', "Die ID ist im System nicht vorhanden");
#$smarty->assign('erfassen_status_field_id', "ID");
#$smarty->assign('erfassen_status_field_titel', "Betreff");
#$smarty->assign('erfassen_status_field_erstelldatum', "Erstelldatum");
#$smarty->assign('erfassen_status_field_select', "Auswahl");
#$smarty->assign('erfassen_status_mandatory_text', "Es ist zu einem Fehler gekommen. Bitte f&uuml;llen Sie alle Pflichtfelder aus.");
#$smarty->assign('erfassen_status_field_ersteller', "Ersteller/Ansprechpartner:");
#$smarty->assign('erfassen_status_field_mailadresse', "Mailadresse:");
#$smarty->assign('erfassen_status_field_gruppe', "Gruppenzugeh&ouml;rigkeit:");
#$smarty->assign('erfassen_status_field_gruppenmitglieder', "weitere Einreicher (Gruppenmitglieder):");
#$smarty->assign('erfassen_status_field_betreff', "Betreff:");
#$smarty->assign('erfassen_status_field_beschreibung', "Situationsbeschreibung:");
#$smarty->assign('erfassen_status_field_vorschlag', "Verbesserungsvorschlag und konkreter Umsetzungsplan:");
#$smarty->assign('erfassen_status_field_nutzen', "Nutzen des Verbesserungsvorschlages:");
#$smarty->assign('erfassen_status_field_public', "Ver&ouml;ffentlichung nach Abschluss:");
#$smarty->assign('erfassen_status_field_kategorie', "Kategorie:");
#$smarty->assign('erfassen_status_field_admhinweis', "Hinweis Administrator:");
#$smarty->assign('erfassen_status_field_eigenhinweis', "Eigener Hinweis:");
#$smarty->assign('erfassen_status_field_datum', "Datum");
#$smarty->assign('erfassen_status_field_status', "Status");
#$smarty->assign('erfassen_status_success_titel', "Hinweis erfasst");
#$smarty->assign('erfassen_status_success_text', "Hinweis wurde erfasst!");


# ausschuss_gutachter.html
#$smarty->assign('ausschuss_gutachter_titel', "Gutachterbest&auml;tigung");

# ausschuss_bearbeiten.html
#$smarty->assign('ausschuss_bearbeiten_titel', "Gutachterbest&auml;tigung");
#$smarty->assign('ausschuss_bearbeiten_err_titel', "Fehlerhafte ID");
#$smarty->assign('ausschuss_bearbeiten_err_text', "Die ID ist im System nicht vorhanden");


# ausschuss_edit.html
#$smarty->assign('ausschuss_edit_field_id', "ID:");
#$smarty->assign('ausschuss_edit_field_betreff', "Betreff:");
#$smarty->assign('ausschuss_edit_field_beschreibung', "Situationsbeschreibung:");
#$smarty->assign('ausschuss_edit_field_vorschlag', "Verbesserungsvorschlag und konkreter Umsetzungsplan:");
#$smarty->assign('ausschuss_edit_field_nutzen', "Nutzen des Verbesserungsvorschlages:");
#$smarty->assign('ausschuss_edit_field_category', "Kategorie:");
#$smarty->assign('ausschuss_edit_field_name', "Name");
#$smarty->assign('ausschuss_edit_field_auswahl', "Auswahl");
#$smarty->assign('ausschuss_edit_field_hinweis', "Hinweis");
#$smarty->assign('ausschuss_edit_field_frist', "Frist");
#$smarty->assign('ausschuss_edit_field_datum', "Datum");
#$smarty->assign('ausschuss_edit_field_status', "Status");
#$smarty->assign('ausschuss_edit_abgeschlossen_titel', "Daten gespeichert");
#$smarty->assign('ausschuss_edit_abgeschlossen_text1', "Der/die Gutachter wurde/n gespeichert");
#$smarty->assign('ausschuss_edit_abgeschlossen_text2', "Sie werden automatisch weitergeleitet!");

# beteiligte_offen.html
#$smarty->assign('beteiligte_offen_titel', "Beteiligungen");

# beteiligte_bearbeiten.html
#$smarty->assign('beteiligte_bearbeiten_titel', "Stellungnahme");
#$smarty->assign('beteiligte_bearbeiten_err_titel', "Fehlerhafte ID");
#$smarty->assign('beteiligte_bearbeiten_err_text', "Die ID ist im System nicht vorhanden");


# beteiligte_edit.html
#$smarty->assign('beteiligte_edit_field_id', "ID:");
#$smarty->assign('beteiligte_edit_field_betreff', "Betreff:");
#$smarty->assign('beteiligte_edit_field_beschreibung', "Situationsbeschreibung:");
#$smarty->assign('beteiligte_edit_field_vorschlag', "Verbesserungsvorschlag und konkreter Umsetzungsplan:");
#$smarty->assign('beteiligte_edit_field_nutzen_desc', "Nutzen des Verbesserungsvorschlages:");
#$smarty->assign('beteiligte_edit_field_category', "Kategorie:");
#$smarty->assign('beteiligte_edit_abgeschlossen_titel', "Daten gespeichert");
#$smarty->assign('beteiligte_edit_abgeschlossen_text1', "Die Stellungnahme wurde gespeichert");
#$smarty->assign('beteiligte_edit_abgeschlossen_text2', "Sie werden automatisch weitergeleitet!");
#$smarty->assign('beteiligte_edit_field_category', "Kategorie:");
#$smarty->assign('beteiligte_edit_field_zweck', "1) Zweck");
#$smarty->assign('beteiligte_edit_field_zweck_text', "Ist der Zweck der Idee sinnvoll im Sinne der Ziele des Ideenmanagements? <br>");
#$smarty->assign('beteiligte_edit_field_umsetzung', "2) Umsetzung");
#$smarty->assign('beteiligte_edit_field_umsetzung_text', "Ist die Umsetzung der Idee technisch und operativ m&ouml;glich? W&uuml;rde die Umsetzung akzeptiert werden? <br>Wenn nein, warum nicht? Gibt es bessere Alternativen?<br>Wie hoch ist der Umsetzungsaufwand?<br>Wie sind die Anwendungszeit, -h&auml;ufigkeit und -orte einzusch&auml;tzen?<br>");
#$smarty->assign('beteiligte_edit_field_nutzen', "3) Nutzen");
#$smarty->assign('beteiligte_edit_field_nutzen_text', "Wie ist der Nutzen der Idee einzusch&auml;tzen?");
#$smarty->assign('beteiligte_edit_field_nutzenim_text', "a. Welcher Nutzen kann im Sinne des Ideenmanagements erwartet werden?");
#$smarty->assign('beteiligte_edit_field_kosteneinsparung_text', "b. In welchem Ausma&szlig; k&ouml;nnen Kosteneinsparungen erwartet werden?");
#$smarty->assign('beteiligte_edit_field_arbeitszeit_text', "c. In welchem Ausma&szlig; kann die Arbeitszeit eingespart werden?");
#$smarty->assign('beteiligte_edit_field_innovation', "4) Innovation");
#$smarty->assign('beteiligte_edit_field_innovation_text', "Wie neu ist die Idee f&uuml;r die Hochschule? Gibt es diese Idee schon seit l&auml;ngerer Zeit an der Hochschule? Wurde diese Idee bereits schon einmal eingebracht oder umgesetzt?");
#$smarty->assign('beteiligte_edit_field_empfehlung', "5) Empfehlung &uuml;ber Annahme / Ablehnung der Idee");
#$smarty->assign('beteiligte_edit_abgeschlossen_titel', "Daten gespeichert");
#$smarty->assign('beteiligte_edit_abgeschlossen_text1', "Die Stellungnahme wurde gespeichert");
#$smarty->assign('beteiligte_edit_abgeschlossen_text2', "Sie werden automatisch weitergeleitet!");

# gutachten_offen.html
#$smarty->assign('gutachten_offen_titel', "Gutachten");


# gutachten_bearbeiten.html
#$smarty->assign('gutachten_bearbeiten_titel', "Gutachten");
#$smarty->assign('gutachten_bearbeiten_err_titel', "Fehlerhafte ID");
#$smarty->assign('gutachten_bearbeiten_err_text', "Die ID ist im System nicht vorhanden");

# gutachten_edit.html
#$smarty->assign('gutachten_edit_vorwort', "Um eine sachliche Entscheidung &uuml;ber die eingereichte Idee treffen zu k&ouml;nnen, ben&ouml;tigt der Ausschuss Ideenmanagement eine objektive, pr&auml;zise und fachliche Stellungnahme eines fachlich geeigneten Gutachters. Bitte halten Sie Stillschweigen &uuml;ber die eingereichte Idee ein. <br><br>Wir k&ouml;nnen die Motivation zum Einreichen der Ideen steigern, indem wir schnelle, aber ausreichend begr&uuml;ndete Antworten geben. Der Bearbeitungsaufwand soll sich am zu erwartenden Nutzen orientieren. Sollten Sie die Frist voraussichtlich nicht einhalten k&ouml;nnen, stimmen Sie bitte eine Zeitspanne mit dem QMB ab.");
#$smarty->assign('gutachten_edit_field_id', "ID:");
#$smarty->assign('gutachten_edit_field_betreff', "Betreff:");
#$smarty->assign('gutachten_edit_field_beschreibung', "Situationsbeschreibung:");
#$smarty->assign('gutachten_edit_field_vorschlag', "Verbesserungsvorschlag und konkreter Umsetzungsplan:");
#$smarty->assign('gutachten_edit_field_nutzen1', "Nutzen des Verbesserungsvorschlages:");



# ansicht_stellungnahme.html
#$smarty->assign('ansicht_stellungnahme_titel', "Stellungnahme");
#$smarty->assign('ansicht_stellungnahme_field_betreff', "Betreff:");
#$smarty->assign('ansicht_stellungnahme_field_datum', "Einreichdatum:");
#$smarty->assign('ansicht_stellungnahme_field_stellungnahme', "Stellungnahme:");
#$smarty->assign('ansicht_stellungnahme_field_zweck', "Zweck:");
#$smarty->assign('ansicht_stellungnahme_field_umsetzung', "Umsetzung:");
#$smarty->assign('ansicht_stellungnahme_field_nutzen', "Nutzen:");
#$smarty->assign('ansicht_stellungnahme_field_kosteneinsparung', "Kosteneinsparung:");
#$smarty->assign('ansicht_stellungnahme_field_arbeitszeiteinsparung', "Einsparung der Arbeitszeit:");
#$smarty->assign('ansicht_stellungnahme_field_ideeneu', "Innovation:");
#$smarty->assign('ansicht_stellungnahme_field_empfehlung', "Empfehlung:");

# ansicht_gutachten.html
#$smarty->assign('ansicht_gutachten_titel', "Gutachten");
#$smarty->assign('ansicht_gutachten_field_betreff', "Betreff:");
#$smarty->assign('ansicht_gutachten_field_datum', "Einreichdatum:");
#$smarty->assign('ansicht_gutachten_field_zweck', "Zweck:");
#$smarty->assign('ansicht_gutachten_field_umsetzung', "Umsetzung:");
#$smarty->assign('ansicht_gutachten_field_nutzen', "Nutzen:");
#$smarty->assign('ansicht_gutachten_field_kosteneinsparung', "Kosteneinsparung:");
#$smarty->assign('ansicht_gutachten_field_arbeitszeiteinsparung', "Einsparung der Arbeitszeit:");
#$smarty->assign('ansicht_gutachten_field_ideeneu', "Innovation:");
#$smarty->assign('ansicht_gutachten_field_empfehlung', "Empfehlung:");

# ausschuss_bearbeitung_ansicht.html
#$smarty->assign('ausschuss_bearbeitung_ansicht_titel', "Verbesserungsvorschlag anzeigen");

/*
# ausschuss_uberblick.html
#$smarty->assign('ausschuss_uberblick_field_id', "ID:");
#$smarty->assign('ausschuss_uberblick_field_betreff', "Betreff:");
#$smarty->assign('ausschuss_uberblick_field_beschreibung', "Situationsbeschreibung:");
#$smarty->assign('ausschuss_uberblick_field_vorschlag', "Verbesserungsvorschlag und konkreter Umsetzungsplan:");
#$smarty->assign('ausschuss_uberblick_field_nutzen', "Nutzen des Verbesserungsvorschlages:");
#$smarty->assign('ausschuss_uberblick_field_public', "Ver&ouml;ffentlichung nach Abschluss:");
#$smarty->assign('ausschuss_uberblick_field_category', "Kategorie:");

#gutachterbenennung.html
#$smarty->assign('ausschuss_gutachter_uberblick_text1', "Bisher benannte Gutachter:");
#$smarty->assign('ausschuss_gutachter_uberblick_field_name', "Name");
#$smarty->assign('ausschuss_gutachter_uberblick_field_frist', "Ausschussfrist");
#$smarty->assign('ausschuss_gutachter_uberblick_field_frist_abgabe', "Abgabefrist Gutacher");
#$smarty->assign('ausschuss_gutachter_uberblick_field_status', "Status");

#ausschuss_beteiligte_uberblick.html
#$smarty->assign('ausschuss_beteiligte_uberblick_text1', "Bisher benannte Beteiligte:");
#$smarty->assign('ausschuss_beteiligte_uberblick_field_name', "Name");
#$smarty->assign('ausschuss_beteiligte_uberblick_field_frist', "Frist");
#$smarty->assign('ausschuss_beteiligte_uberblick_field_status', "Status");
#$smarty->assign('ausschuss_beteiligte_uberblick_field_aktionen', "Aktionen");


# Sitzung_terminieren.html
#$smarty->assign('sitzung_terminieren_titel', "Sitzung terminieren");
#$smarty->assign('sitzung_terminieren_field_datum', "Datum:");
#$smarty->assign('sitzung_terminieren_field_uhr', "Uhrzeit:");
#$smarty->assign('sitzung_terminieren_field_raum', "Raum:");
#$smarty->assign('sitzung_terminieren_field_bemerkung', "Zusatzbemerkung");
#$smarty->assign('sitzung_terminieren_field_id', "ID");
#$smarty->assign('sitzung_terminieren_field_betreff', "Betreff");
#$smarty->assign('sitzung_terminieren_field_status', "Status");
#$smarty->assign('sitzung_terminieren_field_auswahl', "Auswahl");
#$smarty->assign('sitzung_terminieren_titel_success_titel', "Sitzung terminiert");
#$smarty->assign('sitzung_terminieren_titel_success_text', "Die Sitzung wurde terminiert. Der Ausschuss wird &uuml;ber den Termin informiert!");

# Sitzung_verwalten.html
#$smarty->assign('sitzung_verwalten_titel', "Sitzung verwalten");
#$smarty->assign('sitzung_verwalten_field_datum1', "Datum");
#$smarty->assign('sitzung_verwalten_field_zeit1', "Zeit");
#$smarty->assign('sitzung_verwalten_field_raum1', "Raum");
#$smarty->assign('sitzung_verwalten_field_beschreibung1', "Beschreibung");
#$smarty->assign('sitzung_verwalten_field_status1', "Status");
#$smarty->assign('sitzung_verwalten_field_vorlage1', "Vorlage");
#$smarty->assign('sitzung_verwalten_field_auswahl1', "Auswahl");
#$smarty->assign('sitzung_verwalten_field_datum', "Datum:");
#$smarty->assign('sitzung_verwalten_field_uhr', "Uhrzeit:");
#$smarty->assign('sitzung_verwalten_field_raum', "Raum:");
#$smarty->assign('sitzung_verwalten_field_bemerkung', "Zusatzbemerkung");
#$smarty->assign('sitzung_verwalten_field_id', "ID");
#$smarty->assign('sitzung_verwalten_field_betreff', "Betreff");
#$smarty->assign('sitzung_verwalten_field_status', "Status");
#$smarty->assign('sitzung_verwalten_field_auswahl', "Auswahl");
#$smarty->assign('sitzung_verwalten_titel_success_titel', "Sitzung terminiert");
#$smarty->assign('sitzung_verwalten_titel_success_text', "Die Sitzung wurde ge&auml;ndert. Der Ausschuss wird &uuml;ber die &Auml;nderung informiert!");

# sitzung_vertretung.html
#$smarty->assign('sitzung_vertretung_titel', "Vertreter ausw&auml;hlen");
#$smarty->assign('sitzung_vertretung_field_name', "Name");
#$smarty->assign('sitzung_vertretung_field_auswahl', "Auswahl");
#$smarty->assign('sitzung_vertretung_titel_success_titel', "Vertretung benannt");
#$smarty->assign('sitzung_vertretung_titel_success_text', "Die Vertretung wird &uuml;ber den Termin informiert!");















# ansicht_entschieden.html
#$smarty->assign('ansicht_entschieden_titel_ent', "Entschieden");
#$smarty->assign('ansicht_entschieden_titel_aus', "Ausschluss");
#$smarty->assign('ansicht_entschieden_field_id', "ID:");
#$smarty->assign('ansicht_entschieden_field_datumeingang', "Eingangsdatum:");
#$smarty->assign('ansicht_entschieden_field_ersteller', "Ersteller/Ansprechpartner:");
#$smarty->assign('ansicht_entschieden_field_mailadresse', "Mailadresse:");
#$smarty->assign('ansicht_entschieden_field_gruppe', "Gruppenzugeh&ouml;rigkeit:");
#$smarty->assign('ansicht_entschieden_field_gruppenmitglieder', "Weitere Ersteller (bei Gruppenvorschlag):");
#$smarty->assign('ansicht_entschieden_field_betreff', "Betreff:");
#$smarty->assign('ansicht_entschieden_field_beschreibung', "Situationsbeschreibung:");
#$smarty->assign('ansicht_entschieden_field_vorschlag', "Verbesserungsvorschlag und konkreter Umsetzungsplan:");
#$smarty->assign('ansicht_entschieden_field_nutzen', "Nutzen des Verbesserungsvorschlages:");
#$smarty->assign('ansicht_entschieden_field_public', "Ver&ouml;ffentlichung nach Abschluss:");
#$smarty->assign('ansicht_entschieden_field_category', "Kategorie:");
#$smarty->assign('ansicht_entschieden_field_gutname', "Name:");
#$smarty->assign('ansicht_entschieden_field_gutstatus', "Gutachten:");
#$smarty->assign('ansicht_entschieden_field_betname', "Name:");
#$smarty->assign('ansicht_entschieden_field_betstatus', "Stellungnahme:");
#$smarty->assign('ansicht_entschieden_field_datum', "Datum:");
#$smarty->assign('ansicht_entschieden_field_status', "Status:");
#$smarty->assign('ansicht_entschieden_field_ausschlgrund', "Ausschlussgrund:");
#$smarty->assign('ansicht_entschieden_field_entschiedengrund', "Schlie&szlig;grund:");
#$smarty->assign('ansicht_entschieden_field_annahme', "Vorschlag angenommen:");
#$smarty->assign('ansicht_entschieden_field_bemerkung', "Abschlussbemerkung:");
#$smarty->assign('ansicht_entschieden_field_ziel', "Die Umsetzung folgender Ziele des Ideenmanagements wird durch diese Idee verfolgt/erreicht:");
#$smarty->assign('ansicht_entschieden_chk_1', "Erh&ouml;hung der Wirtschaftlichkeit");
#$smarty->assign('ansicht_entschieden_chk_2', "St&auml;rkung der Serviceorientierung");
#$smarty->assign('ansicht_entschieden_chk_3', "Verbesserung der allgemeinen Arbeits- und Lernbedingungen");
#$smarty->assign('ansicht_entschieden_chk_4', "F&ouml;rderung der Arbeitssicherheit und des Arbeitsschutzes");
#$smarty->assign('ansicht_entschieden_chk_5', "Diese Idee tr&auml;gt nicht zur Erreichung eines der definierten Ziele des Ideenmanagements bei");
#$smarty->assign('ansicht_entschieden_field_praemienzahlung', "Pr&auml;mienzahlung:");
#$smarty->assign('ansicht_entschieden_field_gehalt', "Sch&ouml;pferischer Gehalt:");
#$smarty->assign('ansicht_entschieden_field_qualitaet', "Qualit&auml;t der Ausarbeitung:");
#$smarty->assign('ansicht_entschieden_field_anwendungsbreite', "Anwendungsbreite:");
#$smarty->assign('ansicht_entschieden_field_gradverbesserung', "Grad der Verbesserung:");
#$smarty->assign('ansicht_entschieden_field_gesamtpunkte', "Gesamtpunktzahl:");
#$smarty->assign('ansicht_entschieden_field_praemie', "Pr&auml;mie:");
#$smarty->assign('ansicht_entschieden_field_gutschein', "Gutschein:");
#$smarty->assign('ansicht_entschieden_field_dienstbefreiung', "Dienstbefreiung:");
#$smarty->assign('ansicht_entschieden_field_klassierung', "Klassierung:");
#$smarty->assign('ansicht_entschieden_field_umsetzung', "Ma&szlig;nahme zur Umsetzung:");
#$smarty->assign('ansicht_entschieden_field_sachstand', "Sachstand zur Umsetzung:");
#$smarty->assign('ansicht_entschieden_legend_allg', "Allgemeine Daten");
#$smarty->assign('ansicht_entschieden_legend_gut', "Gutachter");
#$smarty->assign('ansicht_entschieden_legend_bet', "Beteiligte");
#$smarty->assign('ansicht_entschieden_legend_schluss', "Entscheidung Ausschuss");
#$smarty->assign('ansicht_entschieden_legend_details', "Statusdetails");

# info_entscheid.html
#$smarty->assign('info_entscheid_titel', "Informationen zur Enscheidung");
#$smarty->assign('info_entscheid_field_annahme', "Wurde der Vorschlag angenommen:");
#$smarty->assign('info_entscheid_field_annahme_bemerkung', "Bemerkung:");
#$smarty->assign('info_entscheid_field_praemie', "Wird eine Pr&auml;mie ausgezahlt:");
#$smarty->assign('info_entscheid_field_punkte_gesamt', "Anzal der Pr&auml;mienpunkte:");
#$smarty->assign('info_entscheid_field_praemie_gutschein', "Auszahlungsbetrag:");
#$smarty->assign('info_entscheid_field_dienstbefreiung', "Dienstbefreiung:");
#$smarty->assign('info_entscheid_field_massnahme', "Ma&szlig;nahmen zur Umsetzung:");


# ausschuss_sitzung.html
#$smarty->assign('ausschuss_sitzung_titel', "Sitzungstermine");
#$smarty->assign('ausschuss_sitzung_field_datum1', "Datum");
#$smarty->assign('ausschuss_sitzung_field_zeit1', "Zeit");
#$smarty->assign('ausschuss_sitzung_field_raum1', "Raum");
#$smarty->assign('ausschuss_sitzung_field_beschreibung1', "Beschreibung");
#$smarty->assign('ausschuss_sitzung_field_vorlage1', "Vorlage");

# passwortverwaltung.html
#$smarty->assign('passwort_titel', "Passwortverwaltung");
#$smarty->assign('passwort_text', "Die Passwortfelder sind standardm&auml;&szlig;ig leer. Soll das aktuelle Passwort ge&auml;ndert werden, muss zuerst das alte Passwort eingegeben werden und danach das neue Passwort. Das neue Passwort darf nicht leer sein.");
#$smarty->assign('passwort_field_pwd_alt', "Altes Passwort:");
#$smarty->assign('passwort_field_pwd_neu', "Neues Passwort:");
#$smarty->assign('passwort_field_pwd_wied', "Wiederholung neues Passwort:");
#$smarty->assign('passwort_success_text', "Das Passwort wurde ge&auml;ndert!");

# bewertungsvorschlag.html
#$smarty->assign('bewertungsvorschlag_mandatory_text', "Es ist zu einem Fehler gekommen. Bitte f&uuml;llen Sie alle Pflichtfelder aus.");
#$smarty->assign('bewertungsvorschlag_text', "Bitte geben Sie ein Bewertungsvorschlag f&uuml;r die Ausschusssitzung ab:");
#$smarty->assign('bewertungsvorschlag_success', "Der Bewertungsvorschlag wurde gespeichert!");
#$smarty->assign('bewertungsvorschlag_field_annahme', "Annahme des Vorschlages:");
#$smarty->assign('bewertungsvorschlag_field_ziel', "Die Umsetzung folgender Ziele des Ideenmanagements wird durch diese Idee verfolgt/erreicht:");
#$smarty->assign('bewertungsvorschlag_chk_1', "Erh&ouml;hung der Wirtschaftlichkeit");
#$smarty->assign('bewertungsvorschlag_chk_2', "St&auml;rkung der Serviceorientierung");
#$smarty->assign('bewertungsvorschlag_chk_3', "Verbesserung der allgemeinen Arbeits- und Lernbedingungen");
#$smarty->assign('bewertungsvorschlag_chk_4', "F&ouml;rderung der Arbeitssicherheit und des Arbeitsschutzes");
#$smarty->assign('bewertungsvorschlag_chk_5', "Diese Idee tr&auml;gt nicht zur Erreichung eines der definierten Ziele des Ideenmanagements bei");
#$smarty->assign('bewertungsvorschlag_field_begruendung', "Begr&uuml;ndung");
#$smarty->assign('bewertungsvorschlag_field_umsetzung', "Umsetzung");
#$smarty->assign('bewertungsvorschlag_field_paemierung', "Pr&auml;mierung:");

# edit_ausschussmitglieder.html
#$smarty->assign('edit_ausschuss_titel', "Ausschussmitglieder verwalten");
#$smarty->assign('edit_ausschuss_mitgl_ausw', "Ausschussmitglieder hinzuf&uuml;gen:");
#$smarty->assign('edit_ausschuss_mitgl_vertreter', "Bei Ausschussvertreter bitte ankreuzen:");
#$smarty->assign('edit_ausschuss_mitgl_vertreter_text', "Welches Ausschussmitglied wird vertreten:");


# praemienkatalog.html
#$smarty->assign('praemienkatalog_titel', "Pr&auml;mien verwalten");
#$smarty->assign('praemienkatalog_field_klassierung', "Klassierung");
#$smarty->assign('praemienkatalog_field_punkte_umsetzbar', "Punkte bei umsetzbaren Ideen");
#$smarty->assign('praemienkatalog_field_punkte_nicht_umsetzbar', "Punkte bei nicht umsetzbaren Ideen");
#$smarty->assign('praemienkatalog_field_praemie_euro', "Pr&auml;mie");
#$smarty->assign('praemienkatalog_field_praemie_dienstfrei', "Dienst- oder Arbeitsbefreiung");
*/
?>
