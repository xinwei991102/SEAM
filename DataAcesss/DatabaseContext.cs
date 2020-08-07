using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Cassandra;
using Cassandra.Data;
using Cassandra.Data.Linq;
using SEAMOrderStoreSystem.Entities;

namespace SEAMOrderStoreSystem.DataAcesss
{
    public class DatabaseContext
    {
        private static DatabaseContext dbContext;
        private Cluster cluster;
        private ISession session;
        

        public List<Product> products = new List<Product>();
        public List<Staff> staffs = new List<Staff>();
        public List<Order> orders = new List<Order>();
        public List<OrderLine> orderLines = new List<OrderLine>();
        public List<Salesman> salesmen = new List<Salesman>();

        private DatabaseContext()
        {
            cluster = Cluster.Builder().AddContactPoints("127.0.0.1").Build();
            session = cluster.Connect("seamdb");
            loadProducts();
            loadStaffs();
            loadOrders();
            loadOrderLines();
            loadSalesmen();
        }


        public static DatabaseContext getContext()
        {
            if(dbContext == null)
            {
                dbContext = new DatabaseContext();
            }
            return dbContext;
        }

        private void loadOrderLines()
        {
            var rs = session.Execute("select * from orderline");
            foreach (var row in rs)
            {

                int orderID = row.GetValue<int>("order_id");
                int productID = row.GetValue<int>("product_id");
                int quantity = row.GetValue<int>("quantity");
                decimal discount = row.GetValue<decimal>("discount");
                OrderLine orderLine = new OrderLine(orderID, productID, quantity, discount);
                orderLines.Add(orderLine);

            }
        }

        private void loadOrders()
        {
            var rs = session.Execute("select * from ordert");
            foreach (var row in rs)
            {
                int id = row.GetValue<int>("id");
                DateTime date = row.GetValue<LocalDate>("order_date").ToDateTimeOffset().DateTime;
                string custName = row.GetValue<string>("cust_name");
                string custEmail = row.GetValue<string>("cust_email");
                string custAddress = row.GetValue<string>("cust_address");
                string status = row.GetValue<string>("status");
                string staffName = row.GetValue<string>("salesman_name");
                Order order = new Order(id,date, custName, custEmail, custAddress, status, staffName);
                orders.Add(order);

            }
        }

        private void loadStaffs()
        {
            var rs = session.Execute("select * from staff");
            foreach (var row in rs)
            {
                
                string name = row.GetValue<string>("name");
                string email = row.GetValue<string>("email");
                string pass = row.GetValue<string>("password");
                string role = row.GetValue<string>("role");
                Staff staff = new Staff(name, email, pass, role);
                staffs.Add(staff);

            }
        }

        private void loadProducts()
        {
            //get products
            var rs = session.Execute("select * from product");
            foreach (var row in rs)
            {
                int id = row.GetValue<int>("id");
                string name = row.GetValue<string>("name");
                decimal price = row.GetValue < decimal>("price");
                string category = row.GetValue<string>("category");
                string manufacturer = row.GetValue<string>("manufacturer");
                string supplier = row.GetValue<string>("supplier");
                string description = row.GetValue<string>("description");
                string comment = row.GetValue<string>("comment");
                string location = row.GetValue<string>("location");
                int stock = row.GetValue<int>("stock");
                int reorderLevel = row.GetValue<int>("reorder_level");
                int targetStock = row.GetValue<int>("target_stock");
                string status = row.GetValue<string>("status");
                Product product = new Product(id, name, price, category,manufacturer,supplier,description,comment,location, stock, reorderLevel, targetStock,status);
                products.Add(product);

            }
        }

        private void loadSalesmen()
        {
            var rs = session.Execute("select * from salesman");
            foreach (var row in rs)
            {
                string name = row.GetValue<string>("name");
                Salesman salesman = new Salesman(name);
                salesmen.Add(salesman);
            }
        }

        public void updateProducts()
        {
         
            var ps = session.Prepare("insert into product (id,name,price,category,manufacturer,supplier,description,comment,location, stock,reorder_level,target_stock,status) values (?,?,?,?,?,?,?,?,?,?,?,?,?)");

            foreach (var product in products)
            {
                var statement = ps.Bind(product.id, product.name, product.price, product.category, product.manufacturer, product.supplier, product.description, product.comment, product.location, product.stock, product.reorderLevel, product.targetStock, product.status);
                session.Execute(statement);
            }
        }

        public void updateStaffs()
        {
            var ps = session.Prepare("insert into staff (name,email,password,role) values (?,?,?,?)");

            foreach (var staff in staffs)
            {
                var statement = ps.Bind(staff.name,staff.email,staff.password,staff.role);
                session.Execute(statement);
            }
        }

        public void updateOrders()
        {
            var ps = session.Prepare("insert into ordert (id,order_date,cust_name,cust_email,cust_address,status,salesman_name) values(?,?,?,?,?,?,?)");

            foreach (var order in orders)
            {
                var statement = ps.Bind(order.id, new LocalDate(order.date.Year, order.date.Month, order.date.Day), order.custName,order.custEmail,order.custAddress,order.status,order.staffName);
                session.Execute(statement);
            }
        }

        public void updateOrderLines()
        {
            var ps = session.Prepare("insert into orderline (order_id,product_id,quantity,discount) values (?,?,?,?)");

            foreach (var orderLine in orderLines)
            {
                var statement = ps.Bind(orderLine.orderID,orderLine.productID,orderLine.quantity,orderLine.discount);
                session.Execute(statement);
            }
        }

      


    }
}