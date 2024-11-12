# Like Hero to Zero (lh2z) - Projekt Setup

Willkommen beim Setup-Guide für das JakartaEE Projekt "Like Hero to Zero" (lh2z). Dieses Dokument führt Sie durch die notwendigen Schritte, um das Projekt von GitHub zu klonen, den Apache Tomcat Server einzurichten, die Datenbank vorzubereiten und die Anwendung zu starten.

## Inhaltsverzeichnis

1. [Projekt klonen](#projekt-klonen)
2. [Apache Tomcat Server einrichten](#apache-tomcat-server-einrichten)
3. [Datenbank einrichten](#datenbank-einrichten)
4. [Anwendung starten](#anwendung-starten)
5. [Testnutzer](#testnutzer)
6. [Weitere Hilfe](#weitere-hilfe)

---

## Projekt klonen

Um das Projekt zu klonen, öffnen Sie Ihr Terminal und führen Sie folgenden Befehl aus:

```bash
git clone https://github.com/thorbenben/lh2z.git
cd lh2z
```

---

## Apache Tomcat Server einrichten

Laden Sie Apache Tomcat 10.1.16 von der offiziellen [Apache Tomcat Website](https://tomcat.apache.org/download-10.cgi) herunter und entpacken Sie das Archiv an einem geeigneten Ort auf Ihrem System. Ich habe den Server über IntelliJ IDEA gestartet.

### [Alternative] Konfiguration

1. Öffnen Sie die `conf/server.xml` Datei im Tomcat-Verzeichnis.
2. Stellen Sie sicher, dass die WAR datei ausgewählt ist.
3. Stellen Sie sicher, dass der Connector auf Port 8080 eingestellt ist:

```xml
<Connector port="8080" protocol="HTTP/1.1"
           connectionTimeout="20000"
           redirectPort="8443" />
```

---

## Datenbank einrichten

### MySQL Datenbank

1. Erstellen Sie eine neue Datenbank namens `lh2zdb`.
2. Importieren Sie die `h2zdb.sql` Datei in Ihre MySQL-Datenbank:

```bash
mysql -u username -p lh2zdb < path/to/h2zdb.sql
```

### Anpassung der `persistence.xml`

Passen Sie die Zugangsdaten in der `persistence.xml` Datei an, um die Verbindung zur Datenbank herzustellen:

```xml
<property name="jakarta.persistence.jdbc.url" value="jdbc:mysql://localhost:3306/h2zdb"/>
<property name="jakarta.persistence.jdbc.user" value="root"/>
<property name="jakarta.persistence.jdbc.password" value="1234"/>
```

---

## Anwendung starten

Öffnen Sie IntelliJ IDEA und importieren Sie das Projekt. Stellen Sie sicher, dass JRE17 als Runtime-Umgebung verwendet wird und der integrierte Application Server konfiguriert ist.

Starten Sie die Anwendung und öffnen Sie folgenden Pfad:

```
http://localhost:8080/lh2z_war/index.xhtml
```

---

## Testnutzer

Zum Testen der Anwendung können Sie folgende Benutzer verwenden:

- **Admin**
  - **Username:** `admin`
  - **Passwort:** `1234`
- **Wissenschaftler**
  - **Username:** `wissenschaftler1`
  - **Passwort:** `1234`
  - **Username:** `wissenschaftler2`
  - **Passwort:** `1234`

---

## Weitere Hilfe

Die Benutzeranleitung befindet sich in der wissenschaftlichen Arbeit.

---

Vielen Dank für die Nutzung von Like Hero to Zero! Bei Fragen oder Problemen steh ich Ihnen gerne zur Verfügung.
