🔹 Fysisk databas

1. Från logisk till fysisk modell
- Tidigare steg: konceptuell + logisk modell → fokus på objekt och relationer.
- Fysisk design: anpassas mot en specifik DBMS (SQL Server).
- Här bestämmer vi kolumntyper, index, constraints, och tabellstruktur.

2. Primärnycklar (Primary Key, PK)
- Varje tabell har en unik identifierare.
- I SQL Server används ofta `INT IDENTITY(1,1)` för korta, unika värden.
- PK ser till att inga duplicerade värden kan infogas → dataintegritet.

3. Främmande nycklar (Foreign Key, FK)
- Implementerar relationer i databasen.
- 1:n-relation: PK på "1"-sidan blir FK på "n"-sidan.
- M:n-relation: kräver kopplingstabell som innehåller PK från båda tabellerna.
- FK kontrollerar att endast giltiga referenser infogas → referensintegritet.

4. Kopplingstabeller för m:n-relationer
- Exempel: Bok ↔ Författare → BookAuthors.
- Fungerar som en fysisk implementering av m:n-relationen.
- PK i kopplingstabellen är ofta en kombination av båda FK.

5. Index och prestanda
- Primärnycklar skapar automatiskt clustered index.
- FK kan ha index för snabbare JOINs.
- Väl vald datatyp + index påverkar prestanda vid stora datamängder.

6. Constraint och dataintegritet
- PK, FK, UNIQUE, CHECK → säkerställer att data alltid är giltig.
- Fysisk design är det sista steget där man förhindrar att felaktig data lagras.

7. TL;DR
- Det som ser logiskt korrekt ut i ER-modellen måste implementeras fysiskt med datatyper, constraints och relationer för att fungera på riktigt i SQL Server.
- Fysisk design = "hur databasen faktiskt lagrar och kopplar data".
