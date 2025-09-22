# Car Demo – Static Classes & Interfaces

Detta demo visar två viktiga koncept i C#:

1. **Static class**  
   `CarHelper` är en statisk klass med en metod `CalculateTravelTime`.  
   - Den kan anropas utan att skapa en instans av klassen.  
   - Används här för att räkna ut hur lång tid en bilresa tar.

2. **Interface**  
   `IDriveable` definierar metoderna `Drive()` och `Stop()`.  
   - `Car` implementerar detta interface.  
   - Ger ett kontrakt som alla "körbara" objekt kan följa.  
   - Gör det möjligt att skriva kod som fungerar med flera typer som implementerar samma interface.

**Exempel i `Program.cs`:**
- Skapar en instans av `Car` och anropar `Drive()` och `Stop()`.
- Använder den statiska `CarHelper.CalculateTravelTime` för att beräkna restid.