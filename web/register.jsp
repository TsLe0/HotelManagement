<%--
    Document   : register
    Created on : Oct 22, 2024, 3:25:41 PM
    Author     : tphon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en" class="light">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="Get started with a free and open-source admin dashboard layout built with Tailwind CSS and Flowbite featuring charts, widgets, CRUD layouts, authentication pages, and more">
        <meta name="author" content="Themesberg">
        <meta name="generator" content="Hugo 0.58.2">
        <title>Register Page</title>
        <link rel="canonical" href="https://flowbite-admin-dashboard.vercel.app/authentication/sign-in/">
        <link rel="stylesheet" href="https://flowbite-admin-dashboard.vercel.app//app.css">
        </head>
    <body class="bg-gray-50 dark:bg-gray-900">
        <main class="bg-gray-50 bg-gray-900"
              style="background-image: url('https://i.redd.it/dr5cbbya3md01.jpg');
              background-position: center;
              background-repeat: no-repeat;
              background-size: cover; /* Added for better image fit */
              ">
            <div class="flex flex-col items-center justify-center px-6 pt-8 mx-auto md:h-screen pt:mt-0 dark:bg-gray-900">
                <div class="w-full max-w-xl p-6 space-y-8 sm:p-8 bg-white rounded-lg shadow dark:bg-gray-800">
                    <h2 class="text-2xl font-bold text-gray-900 dark:text-white">
                        Register
                    </h2>
                    <form class="mt-8 space-y-6" action="register" method="post" id="registerForm">
                        <div>
                            <label for="email" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Email</label>
                            <input type="email" name="email" id="email" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" value="${requestScope.email}" required>
                            <p style="color: red" class="text-sm mt-1">
                                <c:if test="${not empty requestScope.errMail}">${requestScope.errMail}</c:if>
                            </p>
                        </div>
                        <div>
                            <label for="username" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Username</label>
                            <input type="text" name="username" id="username" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" value="${requestScope.username}" required>
                            <p style="color: red" class="text-sm mt-1" id="usernameServerError">
                                <%-- Display specific server-side username errors --%>
                                <c:if test="${not empty requestScope.errUserMessages}">
                                    <ul style="list-style-type: none; padding: 0; margin: 0;">
                                        <c:forEach var="error" items="${requestScope.errUserMessages}">
                                            <li>${error}</li>
                                        </c:forEach>
                                    </ul>
                                </c:if>
                                <%-- If no specific messages, but errUser is set to 'invalid_format' (from server), then show client-side list --%>
                                <c:if test="${empty requestScope.errUserMessages && requestScope.errUser eq 'invalid_format'}">
                                    </c:if>
                            </p>
                     
                        </div>

                        <div>
                            <label for="pass1" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Password</label>
                            <input type="password" name="pass1" id="pass1" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" required>
                        </div>
                        <div>
                            <label for="pass2" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Confirm password</label>
                            <input type="password" name="pass2" id="pass2" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" required>
                            <p style="color: red" class="text-sm mt-1">
                                <c:if test="${not empty requestScope.errPass}">${requestScope.errPass}</c:if>
                            </p>
                        </div>

                        <button type="submit" class="w-full px-5 py-3 text-base font-medium text-center text-white bg-primary-700 rounded-lg hover:bg-primary-800 focus:ring-4 focus:ring-primary-300 sm:w-auto dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800">
                            Create account
                        </button>

                        <a
                            href="home-room"
                            class="w-full px-5 py-3 text-base font-medium text-center text-white bg-red-700 rounded-lg hover:bg-red-800 focus:ring-4 focus:ring-primary-300 sm:w-auto dark:bg-gray-600 dark:hover:bg-secondary-700 dark:focus:ring-primary-800">
                            Cancel
                        </a>

                        <p style="color: #00ff33" class="text-base mt-2">${not empty requestScope.success ? requestScope.success : ''}</p>
                        <div class="text-sm font-medium text-gray-500 dark:text-gray-400">
                            Already have an account? <a href="login" class="text-primary-700 hover:underline dark:text-primary-500">Login here</a>
                        </div>
                    </form>
                </div>
            </div>
        </main>
        <script async defer src="https://buttons.github.io/buttons.js"></script>
        <script src="https://flowbite-admin-dashboard.vercel.app//app.bundle.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.2/datepicker.min.js"></script>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const usernameInput = document.getElementById('username');
                const usernameServerError = document.getElementById('usernameServerError'); // This will now display server errors
                const validationList = document.getElementById('usernameValidationList');

                const validationRules = {
                    length: {
                        regex: /^.{6,20}$/,
                        element: document.getElementById('length'),
                        message: 'Độ dài từ 6 đến 20 ký tự'
                    },
                    noSpaces: {
                        regex: /^\S*$/,
                        element: document.getElementById('noSpaces'),
                        message: 'Không có dấu cách'
                    },
                    validChars: {
                        regex: /^[a-zA-Z0-9_]*$/,
                        element: document.getElementById('validChars'),
                        message: 'Chỉ chứa chữ cái, số và dấu gạch dưới (_)'
                    },
                    noConsecutiveUnderscores: {
                        regex: /^(?!.*__).*$/,
                        element: document.getElementById('noConsecutiveUnderscores'),
                        message: 'Không có hai dấu gạch dưới liên tiếp'
                    },
                    startEndWithLetterOrNumber: {
                        regex: /^[a-zA-Z0-9].*[a-zA-Z0-9]$|^[a-zA-Z0-9]$/,
                        element: document.getElementById('startEndWithLetterOrNumber'),
                        message: 'Bắt đầu và kết thúc bằng chữ cái hoặc số'
                    }
                };

                function validateUsername() {
                    let isValid = true;
                    const username = usernameInput.value;

                    // Clear any previous server-side error message when client starts typing
                    usernameServerError.innerHTML = ''; 

                    // Show the client-side validation list
                    validationList.classList.remove('hidden');

                    if (username.trim() === '') {
                        isValid = false;
                        for (const ruleKey in validationRules) {
                            validationRules[ruleKey].element.classList.add('hidden'); // Hide all rules if empty
                        }
                    } else {
                        for (const ruleKey in validationRules) {
                            const rule = validationRules[ruleKey];
                            if (rule.regex.test(username)) {
                                rule.element.classList.remove('text-red-500');
                                rule.element.classList.add('text-green-500');
                                rule.element.classList.remove('hidden');
                            } else {
                                rule.element.classList.remove('text-green-500');
                                rule.element.classList.add('text-red-500');
                                rule.element.classList.remove('hidden');
                                isValid = false;
                            }
                        }
                    }
                    return isValid;
                }

                // Add event listener for real-time validation
                usernameInput.addEventListener('keyup', validateUsername);
                usernameInput.addEventListener('change', validateUsername);
                usernameInput.addEventListener('blur', validateUsername);

                // Initial validation check if there's a pre-filled value from server
                if (usernameInput.value !== '') {
                    // Check if there are server-side username error messages.
                    // If so, we let the server messages take precedence and hide client-side validation rules.
                    // This relies on the server setting 'errUserMessages' attribute.
                    const hasServerUserErrors = document.querySelector('#usernameServerError ul li') !== null;
                    if (hasServerUserErrors) {
                        validationList.classList.add('hidden'); // Hide client-side list
                    } else {
                        validateUsername(); // Run client-side validation if no specific server errors
                    }
                } else {
                    // If username field is empty on load, ensure validation list is hidden
                    validationList.classList.add('hidden');
                }

                // Optional: Prevent form submission if client-side validation fails
                document.getElementById('registerForm').addEventListener('submit', function (event) {
                    const isUsernameValid = validateUsername();
                    const isEmailValid = document.getElementById('email').checkValidity();
                    const pass1 = document.getElementById('pass1').value;
                    const pass2 = document.getElementById('pass2').value;
                    const arePasswordsMatching = (pass1 === pass2 && pass1.length >= 6); // Add min length for client
                    
                    if (!isEmailValid) {
                        // Browser's default validation message will appear for email
                    }
                    if (!arePasswordsMatching) {
                        // You might want to set a client-side error message for password mismatch here
                        // if you don't want to rely solely on server response for this.
                    }

                    if (!isUsernameValid || !isEmailValid || !arePasswordsMatching) {
                        event.preventDefault(); // Stop form submission
                    }
                });
            });
        </script>
    </body>
</html>