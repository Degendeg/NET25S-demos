1. MongoDB Atlas

Du behöver inte installera MongoDB lokalt, det går direkt i webbläsaren.

1. Gå till https://www.mongodb.com/cloud/atlas eller https://www.mongodb.com/products/tools/compass och skapa ett gratis konto.
2. Skapa ett cluster (det är gratis).
3. När clustret är klart, klicka på "Collections" i din cluster-sida.
4. Där kan du klicka "Create Database", ge databasen ett namn, t.ex. `DemoDB`, och en collection, t.ex. `Users`.

Nu är databasen och collection skapad, och du kan börja skriva dokument.

----------------------------

2. Skriva data (insert)

* Klicka på "Insert Document" i collectionen `Users`.
* Du får upp ett JSON-fält där du kan skriva t.ex.:


{
  "name": "Alice",
  "age": 25,
  "city": "Stockholm"
}


* Klicka Insert → dokumentet sparas direkt.

Du kan lägga till fler dokument på samma sätt.

----------------------------

3. Hämta data

* I Atlas kan du klicka på "Find" i collectionen och se alla dokument.
* Om du vill skriva en query kan du skriva t.ex.:


{ "city": "Stockholm" }


* Då visas bara dokument med Stockholm som stad.

----------------------------

• Tips

* Du behöver inte skriva `db.createCollection` alls om du gör det här i Atlas, det sköts automatiskt via UI.
* Om du vill göra allt via kod istället (t.ex. Node.js, Python), kan jag skriva en superkort demo som körs i webbläsaren/VS Code direkt mot Atlas.

----------------------------

• Ifall problem med access uppstår:

Allow Access From All IP Addresses
On the left side of the screen under SECURITY, click on Network Access.
Click the green Add IP Address button.
In the modal, click the ALLOW ACCESS FROM ANYWHERE button. You should see 0.0.0.0/0 in the Access List Entry field.
Click the green Confirm button.

________________________________________________________________________________________
📢GUIDE: https://medium.com/@yasmeen.othman20/step-by-step-guide-creating-a-database-on-mongodb-atlas-fb1ead561c69
________________________________________________________________________________________