using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace TegraAPI.Models
{
    public partial class defaultContext : DbContext
    {
        public defaultContext()
        {
        }

        public defaultContext(DbContextOptions<defaultContext> options)
            : base(options)
        {
        }

        public virtual DbSet<InvBox> InvBoxes { get; set; } = null!;
        public virtual DbSet<InvBoxProductDetail> InvBoxProductDetails { get; set; } = null!;
        public virtual DbSet<InvProduct> InvProducts { get; set; } = null!;
        public virtual DbSet<VwInvAvailableReport> VwInvAvailableReports { get; set; } = null!;
        public virtual DbSet<VwInvProductDetail> VwInvProductDetails { get; set; } = null!;

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<InvBox>(entity =>
            {
                entity.HasKey(e => e.BoxId);

                entity.Property(e => e.BoxCode)
                    .HasMaxLength(15)
                    .IsUnicode(false);

                entity.Property(e => e.BoxCreationDate).HasColumnType("datetime");

                entity.Property(e => e.BoxCreationUser)
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.Property(e => e.BoxModifDate).HasColumnType("datetime");

                entity.Property(e => e.BoxModifUser)
                    .HasMaxLength(30)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<InvBoxProductDetail>(entity =>
            {
                entity.HasKey(e => e.DetailId);

                entity.Property(e => e.DetailCreationDate).HasColumnType("datetime");

                entity.Property(e => e.DetailCreationUser)
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.Property(e => e.DetailModifDate).HasColumnType("datetime");

                entity.Property(e => e.DetailModifUser)
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.HasOne(d => d.Box)
                    .WithMany(p => p.InvBoxProductDetails)
                    .HasForeignKey(d => d.BoxId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_InvBoxProductDetails_InvBoxes");

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.InvBoxProductDetails)
                    .HasForeignKey(d => d.ProductId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_InvBoxProductDetails_InvProducts");
            });

            modelBuilder.Entity<InvProduct>(entity =>
            {
                entity.HasKey(e => e.ProductId);

                entity.Property(e => e.ProductCode)
                    .HasMaxLength(15)
                    .IsUnicode(false);

                entity.Property(e => e.ProductCreationDate).HasColumnType("datetime");

                entity.Property(e => e.ProductCreationUser)
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.Property(e => e.ProductModifDate).HasColumnType("datetime");

                entity.Property(e => e.ProductModifUser)
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.Property(e => e.ProductName)
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<VwInvAvailableReport>(entity =>
            {
                entity.HasNoKey();

                entity.ToView("vw_InvAvailableReport");

                entity.Property(e => e.LastOperationDate)
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.Property(e => e.Product)
                    .HasMaxLength(15)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<VwInvProductDetail>(entity =>
            {
                entity.HasNoKey();

                entity.ToView("vw_InvProductDetails");

                entity.Property(e => e.BoxCode)
                    .HasMaxLength(15)
                    .IsUnicode(false);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
