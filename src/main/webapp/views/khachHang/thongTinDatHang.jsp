<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Information</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: auto;
            padding: 20px;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .form-section {
            display: flex;
            gap: 20px;
        }
        .form-section .billing-details, .form-section .order-summary {
            flex: 1;
            padding: 20px;
            border: 1px solid #ccc;
        }
        .form-section .order-summary {
            flex: 0.8;
        }
        label {
            font-weight: bold;
            margin-top: 10px;
            display: block;
        }
        input, select, textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        textarea {
            resize: none;
        }
        .order-summary table {
            width: 100%;
            border-collapse: collapse;
        }
        .order-summary table th, .order-summary table td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        .order-summary .total {
            font-weight: bold;
            font-size: 16px;
        }
        .btn {
            background-color: black;
            color: white;
            padding: 10px 20px;
            text-align: center;
            display: block;
            width: 100%;
            border: none;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #444;
        }
        .bank-options img {
            width: 50px;
            height: auto;
            margin: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Order Information</h2>
        <div class="form-section">
            <!-- Billing Details -->
            <div class="billing-details">
                <h3>Billing Details</h3>
                <form action="submitOrder" method="post">
                    <label for="firstName">First Name *</label>
                    <input type="text" id="firstName" name="firstName" required>

                    <label for="phone">Phone *</label>
                    <input type="text" id="phone" name="phone" required>

                    <label for="email">Email Address *</label>
                    <input type="email" id="email" name="email" required>

                    <label for="streetAddress">Street Address *</label>
                    <input type="text" id="streetAddress" name="streetAddress" placeholder="House number and street name" required>

                    <label for="city">City/Province *</label>
                    <select id="city" name="city" required>
                        <option value="">Choose City/Province</option>
                        <option value="Hanoi">Hanoi</option>
                        <option value="HoChiMinh">Ho Chi Minh</option>
                        <!-- Add more options as needed -->
                    </select>

                    <label for="district">District *</label>
                    <select id="district" name="district" required>
                        <option value="">Choose District</option>
                        <option value="District1">District 1</option>
                        <option value="District2">District 2</option>
                        <!-- Add more options as needed -->
                    </select>

                    <label for="ward">Ward *</label>
                    <select id="ward" name="ward" required>
                        <option value="">Choose Ward</option>
                        <option value="Ward1">Ward 1</option>
                        <option value="Ward2">Ward 2</option>
                        <!-- Add more options as needed -->
                    </select>

                    <label for="orderNotes">Order Notes (Optional)</label>
                    <textarea id="orderNotes" name="orderNotes" rows="4" placeholder="Special instructions for delivery"></textarea>
                </form>
            </div>

            <!-- Order Summary -->
            <div class="order-summary">
                <h3>Your Order</h3>
                <table>
                    <tr>
                        <th>Product</th>
                        <th>Subtotal</th>
                    </tr>
                    <tr>
                        <td>Wooden Dining Table × 1</td>
                        <td>5,999,000 đ</td>
                    </tr>
                    <tr>
                        <td>Modern Sofa Set × 1</td>
                        <td>8,499,000 đ</td>
                    </tr>
                    <tr>
                        <td class="total">Total</td>
                        <td class="total">14,498,000 đ</td>
                    </tr>
                </table>

               

                <button type="submit" class="btn">Place Order</button>
            </div>
        </div>
    </div>
</body>
</html>
