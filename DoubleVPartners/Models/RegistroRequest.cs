using System.ComponentModel.DataAnnotations;

namespace DoubleVPartners.Models
{
    public class RegistroRequest
    {
        [Required(ErrorMessage = "Debe ingresar los nombres")]
        public string Nombres { get; set; } = null!;
        [Required(ErrorMessage = "Debe ingresar los apellidos")]
        public string Apellidos { get; set; } = null!;
        [Required(ErrorMessage = "Debe ingresar número de identificación")]
        [Display(Name = "Número de identificación")]
        public string NumeroIdentificacion { get; set; } = null!;
        [Required(ErrorMessage = "Debe ingresar un email")]
        [EmailAddress(ErrorMessage = "Inválido email")]
        public string Email { get; set; } = null!;
        [Required(ErrorMessage = "Debe ingresar tipo de Identificacion")]
        [Display(Name = "Tipo de Identificacion")]
        public string TipoIdentificacion { get; set; } = null!;
        [Display(Name = "Fecha de registro")]
        [DataType(DataType.Date)]
        public DateTime FechaCreacion { get; set; }
        [Required(ErrorMessage = "Debe ingresar un usuario")]
        [Display(Name = "Usuario")]
        public string Usuario1 { get; set; } = null!;
        [Required(ErrorMessage = "Debe ingresar una contraseña")]
        [Display(Name = "Contraseña")]
        [DataType(DataType.Password)]
        public string Pass { get; set; } = null!;
    }
}
