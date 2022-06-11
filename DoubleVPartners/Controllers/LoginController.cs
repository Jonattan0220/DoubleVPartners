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
    public class LoginController : Controller
    {
        private readonly BDDoubleVPartnersContext _context;

        public LoginController(BDDoubleVPartnersContext context)
        {
            _context = context;
        }
        // GET: Personas/Create
        public IActionResult LogIn(string messageLogin = "Introduzca Usuario y Contraseña para validar su Login mediante sus credenciales")
        {
            ViewData["Message"] = messageLogin;
            return View();
        }

        // POST: Personas/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> LogIn([Bind("Usuario1,Pass")] LoginRequest loginRequest)
        {
            if (!ModelState.IsValid)
            {
                ViewData["Message"] = "Error en sus credenciales para validar su login, intente nuevamente";
                    return View(loginRequest);
            }

            var usuarios = await _context.Usuarios.ToListAsync();

            if(usuarios.Count == 0)
            {
                ViewData["Message"] = "Error en sus credenciales para valudar su login, intente nuevamente";
                return View(loginRequest);
            }

            var usuarioLogueado = (from u in usuarios
                                                              where u.Usuario1 == loginRequest.Usuario1 && u.Pass == loginRequest.Pass
                                                              select u).FirstOrDefault();

            if (usuarioLogueado is null)
            {
                ViewData["Message"] = "Error en sus credenciales para validar su login, intente nuevamente";
                return View(loginRequest);
            }

            ViewData["Message"] = string.Concat("Usuario y contraseña válidos. Usuario: ", loginRequest.Usuario1);
            return View();
        }
    }
}
