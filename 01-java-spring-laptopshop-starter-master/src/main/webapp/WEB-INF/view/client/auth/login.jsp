<%@page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Login - SB Admin</title>
    <link href="/css/styles.css" rel="stylesheet" />
    <script
      src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
      crossorigin="anonymous"
    ></script>
    <style>
      body {
        background: #f6f5f7;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        font-family: "Montserrat", sans-serif;
        height: 100vh;
        margin: -20px 0 50px;
      }

      h1 {
        font-weight: bold;
        margin: 0;
      }

      h2 {
        text-align: center;
      }

      p {
        font-size: 14px;
        font-weight: 100;
        line-height: 20px;
        letter-spacing: 0.5px;
        margin: 20px 0 30px;
      }

      span {
        font-size: 12px;
      }

      a {
        color: #333;
        font-size: 14px;
        text-decoration: none;
        margin: 15px 0;
      }

      button {
        border-radius: 20px;
        border: 1px solid #81c408;
        background-color: #81c408;
        color: #ffffff;
        font-size: 12px;
        font-weight: bold;
        padding: 12px 45px;
        letter-spacing: 1px;
        text-transform: uppercase;
        transition: transform 80ms ease-in;
      }

      button:active {
        transform: scale(0.95);
      }

      button:focus {
        outline: none;
      }

      button.ghost {
        background-color: transparent;
        border-color: #ffffff;
      }

      form {
        background-color: #ffffff;
        display: flex;
        align-items: center;
        justify-content: center;
        flex-direction: column;
        padding: 0 50px;
        height: 100%;
        text-align: center;
      }

      input {
        background-color: #eee;
        border: none;
        padding: 12px 15px;
        margin: 8px 0;
        width: 100%;
      }

      .container {
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25),
          0 10px 10px rgba(0, 0, 0, 0.22);
        position: relative;
        overflow: hidden;
        width: 900px;
        max-width: 100%;
        min-height: 550px;
      }

      .form-container {
        position: absolute;
        top: 0;
        height: 100%;
      }

      .sign-in-container {
        left: 0;
        width: 50%;
        z-index: 5;
      }

      .sign-up-container {
        left: 0;
        width: 50%;
        opacity: 0;
        z-index: 1;
        display: none;
      }

      .overlay-container {
        position: absolute;
        top: 0;
        left: 50%;
        width: 50%;
        height: 100%;
        overflow: hidden;
        z-index: 100;
      }

      .overlay {
        background: #81c408;
        background: -webkit-linear-gradient(to right, #81c408, #8fd400);
        background: linear-gradient(to right, #81c408, #8fd400);
        background-repeat: no-repeat;
        background-size: cover;
        background-position: 0 0;
        color: #ffffff;
        position: relative;
        left: -100%;
        height: 100%;
        width: 200%;
        transform: translateX(0);
        transition: transform 0.6s ease-in-out;
      }

      .container.right-panel-active .overlay {
        transform: translateX(50%);
      }

      .overlay-panel {
        position: absolute;
        display: flex;
        align-items: center;
        justify-content: center;
        flex-direction: column;
        padding: 0 40px;
        text-align: center;
        top: 0;
        height: 100%;
        width: 50%;
        transform: translateX(0);
        transition: transform 0.6s ease-in-out;
      }

      .overlay-left {
        transform: translateX(-20%);
      }

      .container.right-panel-active .overlay-left {
        transform: translateX(0);
      }

      .overlay-right {
        right: 0;
        transform: translateX(0);
      }

      .container.right-panel-active .overlay-right {
        transform: translateX(20%);
      }

      .social-container {
        margin: 20px 0;
      }

      .social-container a {
        border: 1px solid #dddddd;
        border-radius: 50%;
        display: inline-flex;
        justify-content: center;
        align-items: center;
        margin: 0 5px;
        height: 40px;
        width: 40px;
      }

      .password-container {
        position: relative;
        width: 100%;
      }

      .password-container input {
        padding-right: 40px;
      }

      .toggle-password {
        position: absolute;
        right: 10px;
        top: 50%;
        transform: translateY(-50%);
        background: none;
        border: none;
        cursor: pointer;
        padding: 0;
        color: #666;
      }

      .toggle-password:focus {
        outline: none;
      }
    </style>
  </head>

  <body>
    <div id="layoutAuthentication">
      <div id="layoutAuthentication_content">
        <main>
          <div class="container" style="margin-top: 100px" id="container">
            <div class="form-container sign-in-container">
              <form action="/login" method="post">
                <c:if test="${param.error != null}">
                  <div
                    class="alert alert-danger"
                    role="alert"
                    style="
                      margin-bottom: 20px;
                      padding: 10px;
                      border-radius: 5px;
                      background-color: #ffebee;
                      color: #c62828;
                      border: 1px solid #ffcdd2;
                    "
                  >
                    <i class="fas fa-exclamation-circle"></i> Invalid email or
                    password.
                  </div>
                </c:if>
                <!-- <c:if test="${param.error != null}">
                  <div
                    class="alert alert-danger"
                    role="alert"
                    style="
                      margin-bottom: 20px;
                      padding: 10px;
                      border-radius: 5px;
                      background-color: #ffebee;
                      color: #c62828;
                      border: 1px solid #ffcdd2;
                    "
                  >
                    <i class="fas fa-exclamation-circle"></i> Invalid email or
                    password.
                  </div>
                </c:if> -->
                <h1>Sign in</h1>
                <div class="social-container">
                  <a href="#" class="social"
                    ><i class="fab fa-facebook-f"></i
                  ></a>
                  <a href="#" class="social"
                    ><i class="fab fa-google-plus-g"></i
                  ></a>
                  <a href="#" class="social"
                    ><i class="fab fa-linkedin-in"></i
                  ></a>
                </div>
                <span>or use your account</span>
                <input type="email" placeholder="Email" name="username" />
                <div class="password-container">
                  <input
                    type="password"
                    placeholder="Password"
                    name="password"
                    id="password"
                  />
                  <button
                    type="button"
                    class="toggle-password"
                    onclick="togglePassword('password')"
                  >
                    <i class="fas fa-eye"></i>
                  </button>
                </div>
                <div>
                  <input
                    type="hidden"
                    name="${_csrf.parameterName}"
                    value="${_csrf.token}"
                  />
                </div>
                <a href="#">Forgot your password?</a>
                <button type="submit">Sign In</button>
              </form>
            </div>
            <div class="form-container sign-up-container">
              <form action="/register" method="post">
                <h1>Create Account</h1>
                <div class="social-container">
                  <a href="#" class="social"
                    ><i class="fab fa-facebook-f"></i
                  ></a>
                  <a href="#" class="social"
                    ><i class="fab fa-google-plus-g"></i
                  ></a>
                  <a href="#" class="social"
                    ><i class="fab fa-linkedin-in"></i
                  ></a>
                </div>
                <span>or use your email for registration</span>
                <div class="row">
                  <div class="col-md-6">
                    <input
                      type="text"
                      placeholder="First Name"
                      name="firstName"
                      required
                    />
                  </div>
                  <div class="col-md-6">
                    <input
                      type="text"
                      placeholder="Last Name"
                      name="lastName"
                      required
                    />
                  </div>
                </div>
                <input type="email" placeholder="Email" name="email" />
                <div class="password-container">
                  <input
                    type="password"
                    placeholder="Password"
                    name="password"
                    id="registerPassword"
                  />
                  <button
                    type="button"
                    class="toggle-password"
                    onclick="togglePassword('registerPassword')"
                  >
                    <i class="fas fa-eye"></i>
                  </button>
                </div>
                <div class="password-container">
                  <input
                    type="password"
                    placeholder="Confirm Password"
                    name="confirmPassword"
                    id="confirmPassword"
                  />
                  <button
                    type="button"
                    class="toggle-password"
                    onclick="togglePassword('confirmPassword')"
                  >
                    <i class="fas fa-eye"></i>
                  </button>
                </div>
                <button type="submit">Sign Up</button>
              </form>
            </div>
            <div class="overlay-container">
              <div class="overlay">
                <div class="overlay-panel overlay-left">
                  <h1>Welcome Back!</h1>
                  <p>
                    To keep connected with us please login with your personal
                    info
                  </p>
                  <button class="ghost" id="signIn">Sign In</button>
                </div>
                <div class="overlay-panel overlay-right">
                  <h1>Hello, Friend!</h1>
                  <p>Enter your personal details and start journey with us</p>
                  <button class="ghost" id="signUp">Sign Up</button>
                </div>
              </div>
            </div>
          </div>
        </main>
      </div>
    </div>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      crossorigin="anonymous"
    ></script>
    <script src="/js/scripts.js"></script>
    <script>
      const signUpButton = document.getElementById("signUp");
      const signInButton = document.getElementById("signIn");

      signUpButton.addEventListener("click", () => {
        window.location.href = "/register";
      });

      signInButton.addEventListener("click", () => {
        window.location.href = "/login";
      });

      function togglePassword(inputId) {
        const passwordInput = document.getElementById(inputId);
        const toggleButton = passwordInput.nextElementSibling;
        const icon = toggleButton.querySelector("i");

        if (passwordInput.type === "password") {
          passwordInput.type = "text";
          icon.classList.remove("fa-eye");
          icon.classList.add("fa-eye-slash");
        } else {
          passwordInput.type = "password";
          icon.classList.remove("fa-eye-slash");
          icon.classList.add("fa-eye");
        }
      }
    </script>
  </body>
</html>
