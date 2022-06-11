using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace DoubleVPartners.Models
{
    public partial class Persona
    {
        public int Id { get; set; }
        public string Nombres { get; set; } = null!;
        public string Apellidos { get; set; } = null!;
        [Display(Name = "Número de identificación")]
        public string NumeroIdentificacion { get; set; } = null!;
        public string Email { get; set; } = null!;
        [Display(Name = "Tipo de identificación")]
        public string TipoIdentificacion { get; set; } = null!;
        [Display(Name = "Fecha de registro")]
        [DataType(DataType.Date)]
        public DateTime FechaCreacion { get; set; }
        public string NumTipoIdentificacion { get; set; } = null!;
        public string NombresApellidos { get; set; } = null!;
        [ValidateNever]
        public virtual Usuario? Usuario { get; set; } = null!;
    }
}
