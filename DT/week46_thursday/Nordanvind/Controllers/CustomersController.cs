using Microsoft.AspNetCore.Mvc;
using Nordanvind.Data;
using Nordanvind.Models;

namespace Nordanvind.Controllers
{
  public class CustomersController : Controller
  {
    private readonly NorthwindContext _context;

    public CustomersController(NorthwindContext context)
    {
      _context = context;
    }

    public IActionResult Index()
    {
      var customers = _context.Customers.ToList();
      return View(customers);
    }

    [HttpGet]
    public IActionResult Create()
    {
      return View();
    }

    [HttpPost]
    public IActionResult Create(Customer c)
    {
      if (ModelState.IsValid)
      {
        _context.Add(c);
        _context.SaveChanges();
        return RedirectToAction(nameof(Index));
      }
      return View(c);
    }

    [HttpGet]
    public IActionResult Delete(string id)
    {
      var customer = _context.Customers.Find(id);
      if (customer == null) return NotFound();
      return View(customer);
    }

    [HttpPost, ActionName("Delete")]
    public IActionResult DeleteConfirmed(string id)
    {
      var customer = _context.Customers.Find(id);
      if (customer == null) return NotFound();

      _context.Customers.Remove(customer);
      _context.SaveChanges();
      return RedirectToAction(nameof(Index));
    }
  }
}