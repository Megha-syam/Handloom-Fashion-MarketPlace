<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Buyer Dashboard - Handloom Fashion</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        /* Reset and base styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        :root {
            --primary-color: #00796b;
            --primary-dark: #004d40;
            --primary-light: #48a999;
            --accent-color: #ffd700;
            --background-light: #e0f7fa;
            --text-color: #333;
            --white: #ffffff;
            --gray-light: #f5f5f5;
            --shadow-sm: 0 2px 4px rgba(0, 0, 0, 0.1);
            --shadow-md: 0 4px 8px rgba(0, 0, 0, 0.2);
            --shadow-lg: 0 8px 16px rgba(0, 0, 0, 0.3);
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, var(--background-light) 0%, #b2ebf2 100%);
            color: var(--text-color);
            line-height: 1.6;
            min-height: 100vh;
        }

        /* Header styles */
        header {
            background: var(--primary-color);
            color: var(--white);
            padding: 1rem 0;
            position: sticky;
            top: 0;
            z-index: 1000;
            box-shadow: var(--shadow-md);
        }

        .header-content {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        header h1 {
            font-size: 2em;
            font-weight: 700;
            letter-spacing: 1px;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        header h1 i {
            color: var(--accent-color);
        }

        nav ul {
            display: flex;
            gap: 2rem;
            list-style: none;
        }

        nav ul li a {
            color: var(--white);
            text-decoration: none;
            font-weight: 500;
            padding: 0.5rem 1rem;
            border-radius: 4px;
            transition: all 0.3s ease;
        }

        nav ul li a:hover {
            background: var(--primary-light);
            text-decoration: none;
        }

        /* Main content styles */
        main {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 2rem;
        }

        .dashboard-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            margin-top: 2rem;
        }

        .dashboard-card {
            background: var(--white);
            border-radius: 12px;
            padding: 2rem;
            box-shadow: var(--shadow-md);
            transition: transform 0.3s ease;
        }

        .dashboard-card:hover {
            transform: translateY(-5px);
            box-shadow: var(--shadow-lg);
        }

        .card-header {
            display: flex;
            align-items: center;
            gap: 1rem;
            margin-bottom: 1.5rem;
        }

        .card-header i {
            font-size: 1.5rem;
            color: var(--primary-color);
        }

        /* Product grid styles */
        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 1.5rem;
            margin-top: 1.5rem;
        }

        .product-card {
            background: var(--white);
            border-radius: 8px;
            padding: 1.5rem;
            box-shadow: var(--shadow-sm);
            transition: transform 0.3s ease;
        }

        .product-card:hover {
            transform: translateY(-3px);
            box-shadow: var(--shadow-md);
        }

        .product-image {
            width: 100%;
            height: 200px;
            background: var(--gray-light);
            border-radius: 4px;
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        /* Button styles */
        button {
            background: var(--primary-color);
            color: var(--white);
            border: none;
            border-radius: 6px;
            padding: 0.8rem 1.5rem;
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        button:hover {
            background: var(--primary-dark);
            transform: translateY(-2px);
            box-shadow: var(--shadow-md);
        }

        button i {
            font-size: 1.1rem;
        }

        /* Feedback form styles */
        .feedback-form {
            background: var(--white);
            padding: 2rem;
            border-radius: 12px;
            box-shadow: var(--shadow-md);
        }

        .feedback-form textarea {
            width: 100%;
            padding: 1rem;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin: 1rem 0;
            font-family: inherit;
            resize: vertical;
        }

        /* Order tracking styles */
        .order-timeline {
            position: relative;
            padding: 1rem 0;
        }

        .order-item {
            position: relative;
            padding: 1rem 0 1rem 2rem;
            border-left: 2px solid var(--primary-color);
        }

        .order-item::before {
            content: '';
            position: absolute;
            left: -0.5rem;
            top: 1.5rem;
            width: 1rem;
            height: 1rem;
            background: var(--primary-color);
            border-radius: 50%;
        }

        /* Toast notification */
        .toast {
            position: fixed;
            bottom: 2rem;
            right: 2rem;
            background: var(--primary-color);
            color: var(--white);
            padding: 1rem 2rem;
            border-radius: 6px;
            box-shadow: var(--shadow-md);
            opacity: 0;
            transform: translateY(100%);
            transition: all 0.3s ease;
        }

        .toast.show {
            opacity: 1;
            transform: translateY(0);
        }

        /* Responsive design */
        @media (max-width: 768px) {
            .header-content {
                flex-direction: column;
                text-align: center;
                gap: 1rem;
            }

            nav ul {
                flex-direction: column;
                gap: 1rem;
            }

            .dashboard-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <header>
        <div class="header-content">
            <h1><i class="fas fa-shopping-bag"></i> Buyer Dashboard</h1>
            <nav>
                <ul>
                    <li><a href="#" onclick="showProfile()"><i class="fas fa-user"></i> Profile</a></li>
                    <li><a href="#" onclick="buyerLogout()"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <main>
        <div class="dashboard-grid">
            <div class="dashboard-card">
                <div class="card-header">
                    <i class="fas fa-shopping-cart"></i>
                    <h2>Products</h2>
                </div>
                <button onclick="buyerBrowseProducts()">
                    <i class="fas fa-search"></i> Browse Products
                </button>
            </div>

            <div class="dashboard-card">
                <div class="card-header">
                    <i class="fas fa-box"></i>
                    <h2>Orders</h2>
                </div>
                <button onclick="buyerTrackOrders()">
                    <i class="fas fa-truck"></i> Track Orders
                </button>
            </div>

            <div class="dashboard-card">
                <div class="card-header">
                    <i class="fas fa-comments"></i>
                    <h2>Feedback</h2>
                </div>
                <button onclick="buyerProvideFeedback()">
                    <i class="fas fa-paper-plane"></i> Provide Feedback
                </button>
            </div>
        </div>

        <div id="action-content"></div>
    </main>

    <div id="toast" class="toast"></div>

    <script>
        function showToast(message) {
            const toast = document.getElementById("toast");
            toast.textContent = message;
            toast.classList.add("show");
            setTimeout(() => {
                toast.classList.remove("show");
            }, 2000);
        }

        function buyerBrowseProducts() {
            showToast("Loading products...");
            setTimeout(() => {
                document.getElementById('action-content').innerHTML = `
                    <h3>Products</h3>
                    <div class="product-grid">
                        <div class="product-card">
                            <div class="product-image">Image 1</div>
                            <h4>Handwoven Scarf</h4>
                            <p>Beautifully crafted handloom scarf.</p>
                        </div>
                        <div class="product-card">
                            <div class="product-image">Image 2</div>
                            <h4>Artisan Blanket</h4>
                            <p>Warm and cozy handloom blanket.</p>
                        </div>
                    </div>
                `;
            }, 1000);
        }

        function buyerTrackOrders() {
            showToast("Loading orders...");
            setTimeout(() => {
                document.getElementById('action-content').innerHTML = `
                    <h3>Order Tracking</h3>
                    <div class="order-timeline">
                        <div class="order-item">
                            <strong>Order #1234</strong> - Shipped
                            <p>Expected delivery: 3-5 days</p>
                        </div>
                        <div class="order-item">
                            <strong>Order #5678</strong> - Delivered
                            <p>Delivered on: 10/11/2024</p>
                        </div>
                    </div>
                `;
            }, 1000);
        }

        function buyerProvideFeedback() {
            showToast("Loading feedback form...");
            setTimeout(() => {
                document.getElementById('action-content').innerHTML = `
                    <h3>Provide Feedback</h3>
                    <form class="feedback-form">
                        <label for="feedback">Your Feedback:</label>
                        <textarea id="feedback" rows="5" placeholder="Share your thoughts..."></textarea>
                        <button type="submit">
                            <i class="fas fa-paper-plane"></i> Submit Feedback
                        </button>
                    </form>
                `;
            }, 1000);
        }

        function showProfile() {
            const profileHtml = `
                <div class="profile-card">
                    <h3>Buyer Profile</h3>
                    <p><strong>Username:</strong> buyer123</p>
                    <p><strong>Email:</strong> buyer@example.com</p>
                    <p><strong>Membership:</strong> Premium Member</p>
                </div>
            `;
            document.getElementById('action-content').innerHTML = profileHtml;
        }

        function buyerLogout() {
            showToast("Logging out...");
            setTimeout(() => {
                window.location.href = "/";
            }, 1500);
        }
    </script>
</body>
</html>
