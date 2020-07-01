using Bookstore.Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace Bookstore.DataAccess.Configurations
{
    public class BookConfiguration : IEntityTypeConfiguration<Book>
    {
        public void Configure(EntityTypeBuilder<Book> builder)
        {
            builder.Property(x => x.Title)
                .HasMaxLength(20)
                .IsRequired();
            builder.HasIndex(x => x.Title)
                .IsUnique();
            builder.Property(x => x.Description)
                .HasMaxLength(30)
                .IsRequired();


            builder.HasMany(b => b.BookAuthors)
                .WithOne(ba => ba.Book)
                .HasForeignKey(ba => ba.BookId)
                .OnDelete(DeleteBehavior.Restrict);

            builder.HasMany(o => o.OrderLines)
                .WithOne(ol => ol.Book)
                .HasForeignKey(ol => ol.BookId)
                .OnDelete(DeleteBehavior.Restrict);

        }
    }
}
