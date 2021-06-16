using Microsoft.EntityFrameworkCore;

namespace firstapi.Models
{
    public class PersonContext : DbContext
    {
        public PersonContext(DbContextOptions<PersonContext> options) : base(options)
        {
        }

        public DbSet<PersonItem> Persons { get; set; }
    }
}