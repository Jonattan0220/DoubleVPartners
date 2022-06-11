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
    public class UsuariosController : Controller
    {
        private readonly BDDoubleVPartnersContext _context;

        public UsuariosController(BDDoubleVPartnersContext context)
        {
            _context = context;
        }

        // GET: Usuarios
        public async Task<IActionResult> Index()
        {
            var bDDoubleVPartnersContext = _context.Usuarios.Include(u => u.IdNavigation);
            return View(await bDDoubleVPartnersContext.ToListAsync());
        }

    }
}
