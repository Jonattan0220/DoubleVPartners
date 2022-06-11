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
    public class RegistrosController : Controller
    {
        private readonly BDDoubleVPartnersContext _context;

        public RegistrosController(BDDoubleVPartnersContext context)
        {
            _context = context;
        }

        // GET: Personas/Create
        public IActionResult Create()
        {
            ViewData["fechaActual"] =  DateTime.Now.ToString("yyyy-MM-dd");
            return View();
        }

        // POST: Personas/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,Nombres,Apellidos,NumeroIdentificacion,Email,TipoIdentificacion,FechaCreacion,Usuario1,Pass")] RegistroRequest registroRequest)
        {
            if (ModelState.IsValid)
            {
                var persona = new Persona()
                {
                    Nombres = registroRequest.Nombres,
                    Apellidos = registroRequest.Apellidos,
                    NumeroIdentificacion = registroRequest.NumeroIdentificacion,
                    Email = registroRequest.Email,
                    TipoIdentificacion = registroRequest.TipoIdentificacion,
                    FechaCreacion = registroRequest.FechaCreacion,
                };

                var usuario = new Usuario()
                {
                    Usuario1 = registroRequest.Usuario1,
                    Pass= registroRequest.Pass, 
                    FechaCreacion= registroRequest.FechaCreacion,
                };

                _context.Personas.Add(persona);
                await _context.SaveChangesAsync();

                _context.Usuarios.Add(usuario);
                await _context.SaveChangesAsync();

                return RedirectToAction(nameof(Create));
            }
            return View();
        }

    }
}
