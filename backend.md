# Cartify Backend Specification

## 🎯 Overview
Backend untuk aplikasi e-commerce Cartify menggunakan **Go (Golang)** dan **PostgreSQL** dengan Clean Architecture pattern.

## 🏗️ Architecture

### Clean Architecture Layers
```
├── cmd/                    # Application entry points
├── internal/
│   ├── domain/            # Business logic & entities
│   ├── usecase/           # Application business rules
│   ├── repository/        # Data access interfaces
│   ├── infrastructure/    # External concerns (DB, HTTP, etc)
│   └── delivery/          # Controllers & handlers
├── pkg/                   # Shared packages
├── migrations/            # Database migrations
├── docs/                  # API documentation
└── scripts/               # Deployment scripts
```

## 📊 Database Schema (PostgreSQL)

### Core Tables

#### Users
```sql
CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    avatar_url TEXT,
    is_active BOOLEAN DEFAULT true,
    is_verified BOOLEAN DEFAULT false,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

#### Categories
```sql
CREATE TABLE categories (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(100) NOT NULL,
    slug VARCHAR(100) UNIQUE NOT NULL,
    description TEXT,
    image_url TEXT,
    parent_id UUID REFERENCES categories(id),
    is_active BOOLEAN DEFAULT true,
    sort_order INTEGER DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

#### Products
```sql
CREATE TABLE products (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(255) NOT NULL,
    slug VARCHAR(255) UNIQUE NOT NULL,
    description TEXT,
    short_description TEXT,
    sku VARCHAR(100) UNIQUE NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    original_price DECIMAL(10,2),
    stock_quantity INTEGER DEFAULT 0,
    min_stock_level INTEGER DEFAULT 5,
    weight DECIMAL(8,2),
    dimensions JSONB, -- {length, width, height}
    category_id UUID REFERENCES categories(id),
    brand VARCHAR(100),
    is_active BOOLEAN DEFAULT true,
    is_featured BOOLEAN DEFAULT false,
    rating DECIMAL(3,2) DEFAULT 0.00,
    review_count INTEGER DEFAULT 0,
    view_count INTEGER DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

#### Product Images
```sql
CREATE TABLE product_images (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    product_id UUID REFERENCES products(id) ON DELETE CASCADE,
    image_url TEXT NOT NULL,
    alt_text VARCHAR(255),
    sort_order INTEGER DEFAULT 0,
    is_primary BOOLEAN DEFAULT false,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

#### Product Variants
```sql
CREATE TABLE product_variants (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    product_id UUID REFERENCES products(id) ON DELETE CASCADE,
    name VARCHAR(100) NOT NULL, -- e.g., "Color", "Size"
    value VARCHAR(100) NOT NULL, -- e.g., "Red", "Large"
    price_adjustment DECIMAL(10,2) DEFAULT 0.00,
    stock_quantity INTEGER DEFAULT 0,
    sku VARCHAR(100),
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

#### Cart
```sql
CREATE TABLE cart_items (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES users(id) ON DELETE CASCADE,
    product_id UUID REFERENCES products(id) ON DELETE CASCADE,
    variant_id UUID REFERENCES product_variants(id) ON DELETE SET NULL,
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    price DECIMAL(10,2) NOT NULL, -- Price at time of adding to cart
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(user_id, product_id, variant_id)
);
```

#### Orders
```sql
CREATE TABLE orders (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    order_number VARCHAR(50) UNIQUE NOT NULL,
    user_id UUID REFERENCES users(id),
    status VARCHAR(20) DEFAULT 'pending', -- pending, confirmed, processing, shipped, delivered, cancelled
    subtotal DECIMAL(10,2) NOT NULL,
    tax_amount DECIMAL(10,2) DEFAULT 0.00,
    shipping_cost DECIMAL(10,2) DEFAULT 0.00,
    discount_amount DECIMAL(10,2) DEFAULT 0.00,
    total_amount DECIMAL(10,2) NOT NULL,
    currency VARCHAR(3) DEFAULT 'USD',
    payment_status VARCHAR(20) DEFAULT 'pending', -- pending, paid, failed, refunded
    payment_method VARCHAR(50),
    payment_reference VARCHAR(255),
    shipping_address JSONB NOT NULL,
    billing_address JSONB,
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

#### Order Items
```sql
CREATE TABLE order_items (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    order_id UUID REFERENCES orders(id) ON DELETE CASCADE,
    product_id UUID REFERENCES products(id),
    variant_id UUID REFERENCES product_variants(id),
    product_name VARCHAR(255) NOT NULL,
    product_sku VARCHAR(100) NOT NULL,
    variant_name VARCHAR(100),
    quantity INTEGER NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

#### Reviews
```sql
CREATE TABLE reviews (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    product_id UUID REFERENCES products(id) ON DELETE CASCADE,
    user_id UUID REFERENCES users(id) ON DELETE CASCADE,
    order_id UUID REFERENCES orders(id),
    rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 5),
    title VARCHAR(255),
    comment TEXT,
    is_verified BOOLEAN DEFAULT false,
    is_approved BOOLEAN DEFAULT false,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(product_id, user_id, order_id)
);
```

#### Wishlist
```sql
CREATE TABLE wishlist_items (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES users(id) ON DELETE CASCADE,
    product_id UUID REFERENCES products(id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(user_id, product_id)
);
```

### Indexes
```sql
-- Performance indexes
CREATE INDEX idx_products_category ON products(category_id);
CREATE INDEX idx_products_active ON products(is_active);
CREATE INDEX idx_products_featured ON products(is_featured);
CREATE INDEX idx_products_price ON products(price);
CREATE INDEX idx_products_rating ON products(rating);
CREATE INDEX idx_products_created ON products(created_at);

CREATE INDEX idx_cart_user ON cart_items(user_id);
CREATE INDEX idx_orders_user ON orders(user_id);
CREATE INDEX idx_orders_status ON orders(status);
CREATE INDEX idx_orders_created ON orders(created_at);

CREATE INDEX idx_reviews_product ON reviews(product_id);
CREATE INDEX idx_reviews_user ON reviews(user_id);
```

## 🚀 API Endpoints

### Authentication
```
POST   /api/v1/auth/register
POST   /api/v1/auth/login
POST   /api/v1/auth/refresh
POST   /api/v1/auth/logout
POST   /api/v1/auth/forgot-password
POST   /api/v1/auth/reset-password
GET    /api/v1/auth/verify-email
```

### Users
```
GET    /api/v1/users/profile
PUT    /api/v1/users/profile
POST   /api/v1/users/upload-avatar
GET    /api/v1/users/orders
```

### File Upload
```
POST   /api/v1/upload/product-image    # Upload product image
POST   /api/v1/upload/avatar           # Upload user avatar
POST   /api/v1/upload/category-image   # Upload category image
```

### Products
```
GET    /api/v1/products                    # List products with filters
GET    /api/v1/products/{id}               # Get product details
GET    /api/v1/products/search             # Search products
GET    /api/v1/products/featured           # Get featured products
GET    /api/v1/products/categories/{id}    # Get products by category
```

### Categories
```
GET    /api/v1/categories                  # List all categories
GET    /api/v1/categories/{id}             # Get category details
```

### Cart
```
GET    /api/v1/cart                        # Get user cart
POST   /api/v1/cart/items                  # Add item to cart
PUT    /api/v1/cart/items/{id}             # Update cart item
DELETE /api/v1/cart/items/{id}             # Remove cart item
DELETE /api/v1/cart                        # Clear cart
```

### Orders
```
GET    /api/v1/orders                      # List user orders
POST   /api/v1/orders                      # Create order
GET    /api/v1/orders/{id}                 # Get order details
PUT    /api/v1/orders/{id}/cancel          # Cancel order
```

### Reviews
```
GET    /api/v1/products/{id}/reviews       # Get product reviews
POST   /api/v1/products/{id}/reviews       # Create review
PUT    /api/v1/reviews/{id}                # Update review
DELETE /api/v1/reviews/{id}                # Delete review
```

### Wishlist
```
GET    /api/v1/wishlist                    # Get user wishlist
POST   /api/v1/wishlist                    # Add to wishlist
DELETE /api/v1/wishlist/{id}               # Remove from wishlist
```

## 🛠️ Technology Stack

### Core
- **Go 1.21+** - Main programming language
- **PostgreSQL 15+** - Primary database
- **Redis** - Caching & session storage
- **Docker** - Containerization

### Libraries & Frameworks
- **Gin** - HTTP web framework
- **GORM** - ORM for database operations
- **JWT-Go** - JWT authentication
- **Bcrypt** - Password hashing
- **Viper** - Configuration management
- **Zap** - Structured logging
- **Testify** - Testing framework

### External Services (Optional for Production)
- **Local Storage** - File storage untuk development (product images)
- **SMTP** - Email service (local development)
- **Stripe** - Payment processing (production)
- **CloudFlare** - CDN & security (production)

## 📁 Project Structure

```
cartify-backend/
├── cmd/
│   └── server/
│       └── main.go
├── internal/
│   ├── domain/
│   │   ├── entities/
│   │   │   ├── user.go
│   │   │   ├── product.go
│   │   │   ├── order.go
│   │   │   └── cart.go
│   │   └── repositories/
│   │       ├── user_repository.go
│   │       ├── product_repository.go
│   │       └── order_repository.go
│   ├── usecase/
│   │   ├── auth_usecase.go
│   │   ├── product_usecase.go
│   │   ├── cart_usecase.go
│   │   └── order_usecase.go
│   ├── infrastructure/
│   │   ├── database/
│   │   │   ├── postgres.go
│   │   │   └── redis.go
│   │   ├── repositories/
│   │   │   ├── user_repository_impl.go
│   │   │   └── product_repository_impl.go
│   │   └── external/
│   │       ├── storage.go
│   │       └── email.go
│   └── delivery/
│       ├── http/
│       │   ├── handlers/
│       │   │   ├── auth_handler.go
│       │   │   ├── product_handler.go
│       │   │   └── cart_handler.go
│       │   ├── middleware/
│       │   │   ├── auth.go
│       │   │   ├── cors.go
│       │   │   └── logging.go
│       │   └── routes.go
│       └── grpc/ (optional)
├── pkg/
│   ├── config/
│   ├── logger/
│   ├── utils/
│   └── validator/
├── migrations/
├── docs/
├── scripts/
├── uploads/              # Local file storage
│   ├── products/
│   ├── avatars/
│   └── categories/
├── static/               # Static files served by server
│   ├── images/
│   └── css/
├── docker-compose.yml
├── Dockerfile
├── go.mod
├── go.sum
└── README.md
```

## 🔧 Configuration

### Environment Variables
```bash
# Server
PORT=8080
GIN_MODE=release

# Database
DB_HOST=localhost
DB_PORT=5432
DB_USER=cartify
DB_PASSWORD=password
DB_NAME=cartify_db
DB_SSL_MODE=disable

# Redis
REDIS_HOST=localhost
REDIS_PORT=6379
REDIS_PASSWORD=

# JWT
JWT_SECRET=your-secret-key
JWT_EXPIRE_HOURS=24

# Local Storage
UPLOAD_PATH=./uploads
STATIC_PATH=./static
MAX_UPLOAD_SIZE=10485760  # 10MB

# Email (Local SMTP)
SMTP_HOST=localhost
SMTP_PORT=587
SMTP_USERNAME=
SMTP_PASSWORD=
FROM_EMAIL=noreply@cartify.com

# Payment (Optional for development)
STRIPE_SECRET_KEY=
STRIPE_WEBHOOK_SECRET=
```

## 📁 Local Storage Implementation

### File Upload Structure
```
uploads/
├── products/
│   ├── 2024/
│   │   ├── 01/
│   │   │   ├── product_123_image1.jpg
│   │   │   └── product_123_image2.jpg
│   │   └── 02/
├── avatars/
│   ├── 2024/
│   │   ├── 01/
│   │   │   └── user_456_avatar.jpg
├── categories/
│   ├── 2024/
│   │   ├── 01/
│   │   │   └── category_789_banner.jpg
└── temp/                    # Temporary uploads
```

### Static File Serving
```go
// Serve static files
r.Static("/uploads", "./uploads")
r.Static("/static", "./static")

// Example URL: http://localhost:8080/uploads/products/2024/01/product_123_image1.jpg
```

### File Upload Handler
```go
func UploadFile(c *gin.Context) {
    file, err := c.FormFile("file")
    if err != nil {
        c.JSON(400, gin.H{"error": "No file uploaded"})
        return
    }
    
    // Generate unique filename
    filename := generateUniqueFilename(file.Filename)
    
    // Create directory if not exists
    uploadPath := fmt.Sprintf("./uploads/%s/%s", 
        time.Now().Format("2006/01"), filename)
    
    // Save file
    if err := c.SaveUploadedFile(file, uploadPath); err != nil {
        c.JSON(500, gin.H{"error": "Failed to save file"})
        return
    }
    
    // Return file URL
    fileURL := fmt.Sprintf("/uploads/%s/%s", 
        time.Now().Format("2006/01"), filename)
    
    c.JSON(200, gin.H{
        "url": fileURL,
        "filename": filename,
    })
}
```

## 🚀 Deployment

### Docker Setup
```yaml
# docker-compose.yml
version: '3.8'
services:
  app:
    build: .
    ports:
      - "8080:8080"
    environment:
      - DB_HOST=postgres
      - REDIS_HOST=redis
    depends_on:
      - postgres
      - redis

  postgres:
    image: postgres:15
    environment:
      POSTGRES_DB: cartify_db
      POSTGRES_USER: cartify
      POSTGRES_PASSWORD: password
    volumes:
      - postgres_data:/var/lib/postgresql/data
      - ./migrations:/docker-entrypoint-initdb.d

  redis:
    image: redis:7-alpine
    ports:
      - "6379:6379"

volumes:
  postgres_data:
```

## 📊 Performance Considerations

### Caching Strategy
- **Redis** untuk session dan temporary data
- **Database query caching** untuk frequently accessed data
- **CDN** untuk static assets (images)

### Database Optimization
- **Connection pooling** dengan GORM
- **Query optimization** dengan proper indexing
- **Read replicas** untuk scaling reads

### API Rate Limiting
- **Per-user rate limiting** untuk prevent abuse
- **Global rate limiting** untuk DDoS protection

## 🔒 Security

### Authentication & Authorization
- **JWT tokens** dengan refresh mechanism
- **Role-based access control** (RBAC)
- **Password hashing** dengan bcrypt

### Data Protection
- **Input validation** dan sanitization
- **SQL injection prevention** dengan GORM
- **CORS configuration** untuk web security
- **HTTPS enforcement** di production

## 📈 Monitoring & Logging

### Logging
- **Structured logging** dengan Zap
- **Request/response logging** dengan middleware
- **Error tracking** dengan proper error handling

### Metrics
- **Prometheus metrics** untuk monitoring
- **Health check endpoints** untuk load balancer
- **Database connection monitoring**

## 🧪 Testing

### Test Structure
```
├── tests/
│   ├── unit/
│   ├── integration/
│   └── e2e/
```

### Testing Tools
- **Testify** untuk assertions
- **Gock** untuk HTTP mocking
- **Testcontainers** untuk integration tests

## 📚 API Documentation

### Swagger/OpenAPI
- **Swagger UI** untuk API documentation
- **OpenAPI 3.0** specification
- **Postman collection** untuk testing

---

## 🛠️ Development Setup

### Quick Start
```bash
# 1. Clone repository
git clone <repository-url>
cd cartify-backend

# 2. Setup environment
cp .env.example .env
# Edit .env with your local settings

# 3. Start services with Docker
docker-compose up -d postgres redis

# 4. Run migrations
go run cmd/migrate/main.go up

# 5. Start development server
go run cmd/server/main.go

# 6. Access API
curl http://localhost:8080/api/v1/health
```

### Local Development Features
- ✅ **Local file storage** - No need for AWS S3
- ✅ **SMTP email** - Use local mail server or Gmail
- ✅ **PostgreSQL** - Local database with Docker
- ✅ **Redis** - Local caching with Docker
- ✅ **Hot reload** - Use air for development
- ✅ **Static file serving** - Images served directly by server

### File Upload Testing
```bash
# Test file upload
curl -X POST http://localhost:8080/api/v1/upload/product-image \
  -F "file=@/path/to/image.jpg" \
  -H "Authorization: Bearer <token>"

# Response
{
  "url": "/uploads/products/2024/01/product_123_image1.jpg",
  "filename": "product_123_image1.jpg"
}
```

## 🎯 Next Steps

1. **Setup project structure** dengan Go modules
2. **Implement database migrations** dengan golang-migrate
3. **Create domain entities** dan repositories
4. **Implement authentication** dengan JWT
5. **Build core APIs** (products, cart, orders)
6. **Add file upload functionality** dengan local storage
7. **Add testing** dan documentation
8. **Setup CI/CD** dengan GitHub Actions
9. **Deploy to cloud** (AWS/GCP) - Optional

Backend ini dirancang untuk development yang mudah dengan local storage, scalable, maintainable, dan production-ready dengan best practices Go development! 🚀
