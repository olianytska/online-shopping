using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace online_shopping.Models
{
    public class ProductModel
    {
        //private List<Product> products;
        private List<ViewProductAsNormalno> products;
        private OnlineShoppingEntities db = new OnlineShoppingEntities();
        public ProductModel()
        {
            List<Product_Category> product_Categories = db.Product_Category.ToList();
            var products = (from p in db.Products
                            select new
                            {
                                IdCategory = p.IdCategory,
                                IdProduct = p.IdProduct,
                                Name = p.Name,
                                Price = p.Price,
                                ProductDescription = p.ProductDescription,
                                //Photo = p.Photo
                            }).Take(5).ToList();
            var items = from product in products
                        join product_cat in product_Categories on product.IdCategory equals product_cat.IdCategory
                        select new ViewProductAsNormalno
                        {
                            IdProduct = product.IdProduct,
                            Category = product_cat.Name,
                            Name = product.Name,
                            Price = product.Price,
                            Description = product.ProductDescription,
                            IdCategory = product.IdCategory
                            //Photo = product.Photo
                        };
            this.products = items.ToList();
        }

        public List<ViewProductAsNormalno> findAll()
        {
            return this.products;
        }

        public ViewProductAsNormalno find(int id)
        {
            return this.products.Single(p => p.IdProduct.Equals(id));
        }

    }
}