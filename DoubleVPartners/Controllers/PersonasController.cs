using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using DoubleVPartners.Models;

namespace DoubleVPartners.Controllers
{
    public class PersonasController : Controller
    {
        private readonly BDDoubleVPartnersContext _context;

        public PersonasController(BDDoubleVPartnersContext context)
        {
            _context = context;
        }

        // GET: Personas
        public async Task<IActionResult> Index()
        {
              return _context.Personas != null ? 
                          View(await _context.Personas.ToListAsync()) :
                          Problem("Entity set 'BDDoubleVPartnersContext.Personas'  is null.");
        }
    }
}
