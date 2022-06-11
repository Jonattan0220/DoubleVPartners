using System.ComponentModel.DataAnnotations;

namespace DoubleVPartners.Models
{
    public class LoginRequest
    {
        [Required(ErrorMessage = "Debe ingresar usuario")]
        [Display(Name = "Usuario")]
        public string Usuario1 { get; set; } = null!;
        [Required(ErrorMessage = "Debe ingresar contraseña")]
        [Display(Name = "Contraseña")]
        [DataType(DataType.Password)]
        public string Pass { get; set; } = null!;
    }
}
