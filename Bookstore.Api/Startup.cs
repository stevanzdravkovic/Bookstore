using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Bookstore.Api.Core;
using Bookstore.Application;
using Bookstore.Application.Commands;
using Bookstore.Application.Email;
using Bookstore.Application.Queries;
using Bookstore.DataAccess;
using Bookstore.Implementation.Commands;
using Bookstore.Implementation.Email;
using Bookstore.Implementation.Logging;
using Bookstore.Implementation.Queries;
using Bookstore.Implementation.Validators;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore.Metadata.Conventions;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using Newtonsoft.Json;

namespace Bookstore.Api
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddTransient<IUseCaseLogger, DbUseCaseLogger>();
            services.AddTransient<BookstoreContext>();
            //services.AddTransient<IApplicationActor, FakeApiActor>();

            services.AddTransient<UseCaseExecutor>();

            services.AddTransient<IEmailSender, SmtpEmailSender>();

            


            #region Commands
            //Genre
            services.AddTransient<ICreateGenreCommand, EfCreateGenreCommand>();
            services.AddTransient<IUpdateGenreCommand, EfUpdateGenreCommand>();
            services.AddTransient<IDeleteGenreCommand, EfDeleteGenreCommand>();
            //Role
            services.AddTransient<ICreateRoleCommand, EfCreateRoleCommand>();
            services.AddTransient<IDeleteRoleCommand, EfDeleteRoleCommand>();
            services.AddTransient<IUpdateRoleCommand, EfUpdateRoleCommand>();
            //Publisher
            services.AddTransient<ICreatePublisherCommand, EfCreatePublisherCommand>();
            services.AddTransient<IUpdatePublisherCommand, EfUpdatePublisherCommand>();
            services.AddTransient<IDeletePublisherCommand, EfDeletePublisherCommand>();
            //Author
            services.AddTransient<ICreateAuthorCommand, EfCreateAuthorCommand>();
            services.AddTransient<IUpdateAuthorCommand, EfUpdateAuthorCommand>();
            services.AddTransient<IDeleteAuthorCommand, EfDeleteAuthorCommand>();
            //Book
            services.AddTransient<ICreateBookCommand, EfCreateBookCommand>();
            services.AddTransient<IUpdateBookCommand, EfUpdateBookCommand>();
            services.AddTransient<IDeleteBookCommand, EfDeleteBookCommand>();
            //Order
            services.AddTransient<ICreateOrderCommand, EfCreateOrderCommand>();
            //User
            services.AddTransient<IRegisterUserCommand, EfRegisterUserCommand>();
            services.AddTransient<IUpdateUserCommand, EfUpdateUserCommand>();
            services.AddTransient<IDeleteUserCommand, EfDeleteUserCommand>();
            //upload
            services.AddTransient<IUploadFileCommand, EfUploadFileCommand>();
            #endregion
            #region Queries
            //Genre
            services.AddTransient<IGetGenresQuery, EfGetGenres>();
            services.AddTransient<IGetSingleGenreQuery, EfGetSingleGenre>();
            //Role
            services.AddTransient<IGetRolesQuery, EfGetRoles>();
            services.AddTransient<IGetSingleRoleQuery, EfGetSingleRole>();
            //Publisher
            services.AddTransient<IGetPublishersQuery, EfGetPublishers>();
            services.AddTransient<IGetSinglePublisherQuery, EfGetSinglePublisher>();
            //Author
            services.AddTransient<IGetAuthorsQuery, EfGetAuthors>();
            services.AddTransient<IGetSingleAuthorQuery, EfGetSingleAuthor>();
            //Book
            services.AddTransient<IGetBooksQuery, EfGetBooks>();
            services.AddTransient<IGetSingleBookQuery, EfGetSingleBook>();
            //Order
            services.AddTransient<IGetOrdersQuery, EfGetOrders>();
            services.AddTransient<IGetSingleOrderQuery, EfGetSingleOrder>();
            //User
            services.AddTransient<IGetUsersQuery, EfGetUsers>();
            services.AddTransient<IGetSingleUserQuery, EfGetSingleUser>();
            #endregion
            #region Validators
            //Genre
            services.AddTransient<CreateGenreValidator>();
            services.AddTransient<UpdateGenreValidator>();
            //Role
            services.AddTransient<CreateRoleValidator>();
            services.AddTransient<UpdateRoleValidator>();
            //Publisher
            services.AddTransient<CreatePublisherValidator>();
            services.AddTransient<UpdatePublisherValidator>();
            //Author
            services.AddTransient<CreateAuthorValidator>();
            services.AddTransient<UpdateAuthorValidator>();
            //AuthorBook
            services.AddTransient<CreateAuthorBookValidator>();
            //Book
            services.AddTransient<CreateBookValidator>();
            services.AddTransient<UpdateBookValidator>();
            //BookAuthor
            services.AddTransient<CreateBookAuthorValidator>();
            //Order
            services.AddTransient<CreateOrderValidator>();
            //orderline
            services.AddTransient<CreateOrderLineValidator>();
            //Upload
            services.AddTransient<UploadFileValidator>();
            //User
            services.AddTransient<RegisterUserValidator>();
            services.AddTransient<UpdateUserValidator>();
            #endregion

            //jwtActor-AppActor
            services.AddHttpContextAccessor();
            services.AddTransient<IApplicationActor>(x =>
            {
                var accessor = x.GetService<IHttpContextAccessor>();

                var user = accessor.HttpContext.User;

                if (user.FindFirst("ActorData") == null)
                {
                    return new AnonymousActor();
                }

                var actorString = user.FindFirst("ActorData").Value;

                var actor = JsonConvert.DeserializeObject<JwtActor>(actorString);

                return actor;
            });
            //jwt
            services.AddTransient<JwtManager>();

            services.AddAuthentication(options =>
            {
                options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultSignInScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
            }).AddJwtBearer(cfg =>
            {
                cfg.RequireHttpsMetadata = false;
                cfg.SaveToken = true;
                cfg.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidIssuer = "asp_api",
                    ValidateIssuer = true,
                    ValidAudience = "Any",
                    ValidateAudience = true,
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("ThisIsMyVerySecretKey")),
                    ValidateIssuerSigningKey = true,
                    ValidateLifetime = true,
                    ClockSkew = TimeSpan.Zero
                };
            });



            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "BookStore", Version = "v1" });
                c.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
                {
                    Description = @"JWT Authorization header using the Bearer scheme. \r\n\r\n 
                      Enter 'Bearer' [space] and then your token in the text input below.
                      \r\n\r\nExample: 'Bearer 12345abcdef'",
                    Name = "Authorization",
                    In = ParameterLocation.Header,
                    Type = SecuritySchemeType.ApiKey,
                    Scheme = "Bearer"
                });

                c.AddSecurityRequirement(new OpenApiSecurityRequirement()
                {
                    {
                        new OpenApiSecurityScheme
                          {
                            Reference = new OpenApiReference
                              {
                                Type = ReferenceType.SecurityScheme,
                                Id = "Bearer"
                              },
                              Scheme = "oauth2",
                              Name = "Bearer",
                              In = ParameterLocation.Header,

                            },
                            new List<string>()
                          }
                    });
            });


            services.AddControllers();
            
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseSwagger();

            app.UseSwaggerUI(c =>
            {
                c.SwaggerEndpoint("/swagger/v1/swagger.json", "Swagger");
            });

            app.UseRouting();

            app.UseStaticFiles();
            app.UseAuthentication();
            app.UseAuthorization();
            app.UseMiddleware<GlobalExceptionHandler>();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
