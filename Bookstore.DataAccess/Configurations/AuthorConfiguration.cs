using Bookstore.Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace Bookstore.DataAccess.Configurations
{
    public class AuthorConfiguration : IEntityTypeConfiguration<Author>
    {
        public void Configure(EntityTypeBuilder<Author> builder)
        {
            builder.Property(x => x.FirstName)
                .HasMaxLength(15)
                .IsRequired();
            builder.Property(x => x.LastName)
                .HasMaxLength(15)
                .IsRequired();
            builder.Property(x => x.BirthPlace)
                .HasMaxLength(15)
                .IsRequired();


            builder.HasMany(a => a.AuthorBooks)
                .WithOne(ab => ab.Author)
                .HasForeignKey(ab => ab.AuthorId)
                .OnDelete(DeleteBehavior.Restrict);
        }
    }
}
