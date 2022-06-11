using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace DoubleVPartners.Models
{
    public partial class BDDoubleVPartnersContext : DbContext
    {
        public BDDoubleVPartnersContext()
        {
        }

        public BDDoubleVPartnersContext(DbContextOptions<BDDoubleVPartnersContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Persona> Personas { get; set; } = null!;
        public virtual DbSet<Usuario> Usuarios { get; set; } = null!;

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Persona>(entity =>
            {
                entity.ToTable("Persona");

                entity.HasIndex(e => e.Email, "U_Email")
                    .IsUnique();

                entity.HasIndex(e => e.NumeroIdentificacion, "U_NumeroIdentificacion")
                    .IsUnique();

                entity.Property(e => e.Apellidos)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Email)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.FechaCreacion).HasColumnType("date");

                entity.Property(e => e.Nombres)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.NombresApellidos)
                    .HasMaxLength(101)
                    .IsUnicode(false)
                    .HasComputedColumnSql("(concat([Nombres],' ',[Apellidos]))", false);

                entity.Property(e => e.NumTipoIdentificacion)
                    .HasMaxLength(101)
                    .IsUnicode(false)
                    .HasComputedColumnSql("(concat([NumeroIdentificacion],' ',[TipoIdentificacion]))", false);

                entity.Property(e => e.NumeroIdentificacion)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.TipoIdentificacion)
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Usuario>(entity =>
            {
                entity.ToTable("Usuario");

                entity.HasIndex(e => e.Usuario1, "U_Usuario")
                    .IsUnique();

                entity.Property(e => e.Id).ValueGeneratedOnAdd();

                entity.Property(e => e.FechaCreacion).HasColumnType("date");

                entity.Property(e => e.Pass)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Usuario1)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("Usuario");

                entity.HasOne(d => d.IdNavigation)
                    .WithOne(p => p.Usuario)
                    .HasForeignKey<Usuario>(d => d.Id)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Usuario_Persona");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
