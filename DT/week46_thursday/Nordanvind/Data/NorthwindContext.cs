using Microsoft.EntityFrameworkCore;
using Nordanvind.Models;

namespace Nordanvind.Data
{
    public class NorthwindContext : DbContext
    {
        public NorthwindContext(DbContextOptions<NorthwindContext> options) : base(options) { }
        public DbSet<Product> Products { get; set; }
    }
}