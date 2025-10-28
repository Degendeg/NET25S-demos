## Demo: Normalisering

**DBMS:** SQL Server (SSMS)

**Tips:**
I **SQL Server Management Studio (SSMS)** kan du:

* Trycka **F5** för att köra hela skriptet.
* Markera en del av koden och trycka **F5** för att köra just den delen.

---

### Turordning för detta demo

1. **`normalization_start.sql`**

   * Skapar databasen (med `CREATE DATABASE` och `USE`) om du inte redan gjort det.
   * Lägg in testdata så att:

     * **John Doe** förekommer flera gånger.
     * **Foo Bar** endast en gång.
     * Du får gärna lägga till fler kunder.

2. **`1NF.sql`**

   * Första normalformen: bryt upp upprepade värden i egna rader.

3. **`2NF.sql`**

   * Andra normalformen: dela upp tabellen så att icke-nyckelattribut bara beror på hela nyckeln.

4. **`3NF.sql`**

   * Tredje normalformen: ta bort transitiva beroenden (fält som beror på andra icke-nyckelattribut).

5. **`normalization_finish.sql`**

   * Avslutande steg: visar en mer realistisk modell, t.ex. kunder som gör beställningar med menyvaror i en snabbmatsrestaurang.

**Kör ordningen ovan** steg för steg för att se hur designen utvecklas från en ostrukturerad tabell till en korrekt normaliserad databas i **SQL Server**.
