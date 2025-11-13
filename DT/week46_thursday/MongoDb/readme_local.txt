# MongoDB demo
## Ladda ned: https://fastdl.mongodb.org/windows/mongodb-windows-x86_64-8.2.1-signed.msi
## Ladda ned: https://downloads.mongodb.com/compass/mongosh-2.5.9-x64.msi

Databas: webshop

1️⃣ Skapa databas och collection
use webshop
db.createCollection("products")

2️⃣ Lägg in några produkter
db.products.insertMany([
  { name: "T-shirt", price: 199, stock: 20 },
  { name: "Keps", price: 149, stock: 15 },
  { name: "Skor", price: 899, stock: 8 }
])

3️⃣ Visa alla produkter
db.products.find()

4️⃣ Filtrera
db.products.find({ price: { $gt: 150 } })

5️⃣ Uppdatera en produkt
db.products.updateOne(
  { name: "Keps" },
  { $set: { stock: 10 } }
)

6️⃣ Ta bort en produkt
db.products.deleteOne({ name: "Skor" })

# Kort förklaring:
use webshop → väljer/skapar databasen
insertMany → lägger in flera dokument
find() → hämtar data
$gt → "greater than"
updateOne & deleteOne → ändra / ta bort

_______________________________________________
📢 SE MEDDELANDE I DISCORD: https://t.ly/fwjt3
_______________________________________________