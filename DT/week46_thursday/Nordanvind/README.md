# Steg 1:
```bash
dotnet new mvc -n Nordanvind
cd Nordanvind
```
# Steg 2:
```bash
dotnet add package Microsoft.EntityFrameworkCore.SqlServer --version 9.0.0
dotnet add package Microsoft.EntityFrameworkCore.Tools --version 9.0.0
```
# Steg 3: appsettings.json
```json
"ConnectionStrings": {
  "DefaultConnection": "Server=DITT_NAMN\\SQLEXPRESS;Database=Northwind;Trusted_Connection=True;TrustServerCertificate=True;"
}
```
# Steg 4: Models/Product.cs
```csharp
namespace Nordanvind.Models;

public class Product
{
    public int ProductId { get; set; }
    public string ProductName { get; set; } = "";
    public decimal UnitPrice { get; set; }
}
```
# Steg 5: Data/NorthwindContext.cs
```csharp
using Microsoft.EntityFrameworkCore;
using Nordanvind.Models;

namespace Nordanvind.Data;

public class NorthwindContext : DbContext
{
    public NorthwindContext(DbContextOptions<NorthwindContext> options) : base(options) { }
    public DbSet<Product> Products { get; set; }
}
```
# Steg 6: Program.cs (lägg till nedanstående)
```csharp
using Microsoft.EntityFrameworkCore;
using Nordanvind.Data;

// mer setup ..

builder.Services.AddDbContext<NorthwindContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

// mer setup ..
```
# Steg 7: Controllers/ProductsController.cs
```csharp
using Microsoft.AspNetCore.Mvc;
using Nordanvind.Data;
using Nordanvind.Models;

namespace Nordanvind.Controllers;

public class ProductsController : Controller
{
    private readonly NorthwindContext _context;
    public ProductsController(NorthwindContext context)
    {
        _context = context;
    }

    public IActionResult Index()
    {
        var products = _context.Products.ToList();
        return View(products);
    }

    [HttpGet]
    public IActionResult Create()
    {
        return View();
    }

    [HttpPost]
    public IActionResult Create(Product p)
    {
        if (ModelState.IsValid)
        {
            _context.Add(p);
            _context.SaveChanges();
            return RedirectToAction(nameof(Index));
        }
        return View(p);
    }
}
```
# Steg 8: Views/Products/Index.cshtml
```csharp
@model IEnumerable<Nordanvind.Models.Product>

<div class="d-flex justify-content-between align-items-center">
    <h2 class="m-0">Products</h2>
    <a class="btn btn-primary" href="/Products/Create">Add new</a>
</div>

<table class="table mt-3">
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Price</th>
    </tr>
    @foreach (Product p in Model)
    {
        <tr>
            <td>@p.ProductId</td>
            <td>@p.ProductName</td>
            <td>@p.UnitPrice</td>
        </tr>
    }
</table>
```
# Steg 9: Views/Products/Create.cshtml
```csharp
@model Nordanvind.Models.Product

<h2>Add Product</h2>

<form method="post">
    <div class="mb-3">
        <label>Name</label>
        <input asp-for="ProductName" class="form-control" />
    </div>
    <div class="mb-3">
        <label>Price</label>
        <input asp-for="UnitPrice" class="form-control" />
    </div>
    <button class="btn btn-success">Save</button>
</form>
```
# Köra app (live reload)
```bash
dotnet watch
```