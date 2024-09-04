<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="styles.css">
    <title>Contact Us - Bookstore Support</title>
    <style>
        .form-group {
            margin-bottom: 15px;
        }
        input, textarea {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }
        button {
            padding: 10px 20px;
            color: #fff;
            border: none;
            cursor: pointer;
        }
        button:disabled {
            background-color: #ccc;
        }
    </style>
</head>
<body>
    <header>
        <nav>
            <div class="logo">Bookstore</div>
            <ul class="nav-links">
                <li><a href="index.jsp">Home</a></li>
                <li><a href="product.jsp">Products</a></li>
                <li><a href="order.jsp">Orders</a></li>
                <li><a href="payment.jsp">Payment</a></li>
                <li><a href="contact.jsp">Contact</a></li>
            </ul>

            <div class="user-actions">
                <a href="login.jsp">Login</a>
                <a href="register.jsp">Register</a>
            </div>
        </nav>
    </header>

    <main>
        <section class="contact-section">
            <h1>Contact Us</h1>
            <p>If you are experiencing any issues or have any questions, please fill out the form below, and our support team will get back to you as soon as possible.</p>

            <form id="submitTicketForm" action="submitTicket" method="post">
                <div class="form-group">
                    <label for="name">Full Name:</label>
                    <input type="text" id="name" name="name" required>
                </div>

                <div class="form-group">
                    <label for="email">Email Address:</label>
                    <input type="email" id="email" name="email" required>
                </div>

                <div class="form-group">
                    <label for="issue">Issue Description:</label>
                    <textarea id="issue" name="issue" rows="5" required></textarea>
                </div>

                <div class="form-group">
                    <button type="submit" id="submitTicketButton" disabled>Submit Ticket</button>
                </div>
            </form>
        </section>

        <section class="status-section">
            <h2>Check Ticket Status</h2>
            <form id="checkStatusForm" action="checkTicketStatus" method="post">
                <div class="form-group">
                    <label for="ticketID">Ticket ID:</label>
                    <input type="text" id="ticketID" name="ticketID" required>
                </div>

                <div class="form-group">
                    <button type="submit" id="checkStatusButton" disabled>Check Status</button>
                </div>
            </form>
        </section>
    </main>

    <script>
        document.addEventListener('DOMContentLoaded', () => {
            function validateForm(formId, buttonId) {
                const form = document.getElementById(formId);
                const submitButton = document.getElementById(buttonId);
                const inputs = form.querySelectorAll('input[required], textarea[required]');
                
                function updateButtonState() {
                    let allValid = true;

                    inputs.forEach(input => {
                        if (!input.value.trim()) {
                            allValid = false;
                        }
                    });

                    submitButton.disabled = !allValid;
                    submitButton.style.backgroundColor = allValid ? '#4CAF50' : '#ccc';
                }

                form.addEventListener('input', updateButtonState);
                updateButtonState(); // Initial check
            }

            // Validate both forms
            validateForm('submitTicketForm', 'submitTicketButton');
            validateForm('checkStatusForm', 'checkStatusButton');
        });
    </script>
</body>
</html>