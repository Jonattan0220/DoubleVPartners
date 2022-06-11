using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace DoubleVPartners.Models
{
    public partial class Usuario
    {
        public int Id { get; set; }
        [Display(Name = "Usuario")]
        public string Usuario1 { get; set; } = null!;
        [Display(Name = "Contraseña")]
        public string Pass { get; set; } = null!;
        [Display(Name = "Fecha de registro")]
        [DataType(DataType.Date)]
        public DateTime FechaCreacion { get; set; }
        [ValidateNever]
        public virtual Persona IdNavigation { get; set; } = null!;
    }
}
