

<!-- footer.html -->
<section class="footer-section">
  <div class="footer-container">
    <div class="footer-top">
      <div class="footer-logo-social">
        <div class="footer-logo">
         <img src="./files/images/logo.png" alt="TalentPortalLogo" />
          <span>TalentPortal</span>

        </div>
        <div class="footer-social">
          <a href="https://www.linkedin.com/in/ayushpatidar04?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app" aria-label="Facebook">
            <img src="./files/images/fb.png" alt="Facebook" />
          </a>
          <a href="https://www.linkedin.com/in/ayushpatidar04?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app" aria-label="Twitter">
            <img src="./files/images/twitter.png" alt="Twitter" />
          </a>
          <a href="https://www.linkedin.com/in/ayushpatidar04?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app" aria-label="LinkedIn">
            <img src="./files/images/linkedin.png" alt="LinkedIn" />
          </a>
          <a href="https://www.linkedin.com/in/ayushpatidar04?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app" aria-label="Instagram">
            <img src="./files/images/instagram.png" alt="Instagram" />
          </a>
          <a href="https://www.linkedin.com/in/ayushpatidar04?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app" aria-label="YouTube">
            <img src="./files/images/youtube.png" alt="YouTube" />
          </a>
        </div>
      </div>

      <div class="footer-links">
        <div>
          <h5>Useful Links</h5>
          <ul>
            <li><a href="/TalentPortal">Home</a></li>
            <li><a href="/TalentPortal">About</a></li>
            <li><a href="/TalentPortal">Work</a></li>
            <li><a href="/TalentPortal">Category</a></li>
          </ul>
        </div>
        <div>
          <h5>Our Office</h5>
          <p>Indore, Madhya Pradesh</p>
        </div>
        <div>
          <h5>Founder</h5>
          <p><a class="name-link" href="https://www.linkedin.com/in/ayushpatidar04?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app" target="_blank" rel="noopener noreferrer">Ayush Patidar</a></p>
        </div>
        <div>
          <h5>Subscribe to Newsletter</h5>
          <form class="newsletter-form" action="">
            <input type="email" placeholder="Enter your email" required />
            <button type="submit">Subscribe</button>
          </form>
        </div>
      </div>
    </div>

    <div class="footer-contact">
      <a href="#" class="contact-box" aria-label="Location">
        <img src="./files/images/location.png" alt="Location Icon" />
        <span>Ujjain, Madhya Pradesh</span>
      </a>
      <a href="mailto:ayushpatidar13@gmail.com" class="contact-box" aria-label="Email">
        <img src="./files/images/mail.png" alt="Mail Icon" />
        <span>ayushpatidar13@gmail.com</span>
      </a>
      <a href="tel:+78060XXXXX" class="contact-box" aria-label="Phone">
        <img src="./files/images/call.png" alt="Phone Icon" />
        <span>+91 78060 XXXXX</span>
      </a>
    </div>

    <div class="footer-bottom">
      <p>
        &copy; <span id="year"></span> All Rights Reserved By
        <a href="https://html.design/" target="_blank" rel="noopener noreferrer">Ayush Patidar</a>
      </p>
    </div>
  </div>
</section>

<style>
.footer-section {
  background-color: #04373D;
  color:#00bfa5;
  padding: 40px 20px 20px;
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.footer-container {
  max-width: 1200px;
  margin: auto;
}

.footer-top {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  gap: 40px;
  border-bottom: 1px solid #444;
  padding-bottom: 30px;
  margin-bottom: 20px;
}

.footer-logo-social {
  flex: 1 1 250px;
}

.footer-logo {
  display: flex;
  align-items: center;
  gap: 15px;
  margin-bottom: 15px;
  font-weight: 700;
  font-size: 24px;
  color: #00bfa5;
}

.footer-logo img {
  height: 40px;
  width: auto;
}

.footer-social a {
  display: inline-block;
  margin-right: 12px;
  transition: transform 0.3s ease;
}

.footer-social a img {
  width: 26px;
  height: 26px;
  filter: brightness(0) invert(1);
  transition: filter 0.3s ease;
}

.footer-social a:hover img {
  filter: brightness(1) invert(0);
  transform: scale(1.1);
}

.footer-links {
  display: flex;
  flex: 2 1 600px;
  justify-content: space-between;
  flex-wrap: wrap;
  gap: 20px;
}

.footer-links > div {
  flex: 1 1 200px;
}

.footer-links h5 {
  font-size: 18px;
  margin-bottom: 12px;
  color: #00bfa5;
}

.footer-links ul {
  list-style: none;
  padding: 0;
  margin: 0;
}

.footer-links ul li {
  margin-bottom: 10px;
}

.footer-links ul li a {
  color: #ccc;
  text-decoration: none;
  transition: color 0.3s ease;
}

.footer-links ul li a:hover {
  color: #00bfa5;
}

.footer-links p {
  color: #ccc;
  font-size: 15px;
  line-height: 1.4;
}

.footer-links p:hover {
  color: #00bfa5;
  cursor: pointer;
}


.newsletter-form {
  display: flex;
  gap: 10px;
  margin-top: 8px;
}

.newsletter-form input[type="email"] {
  flex: 1;
  padding: 10px 12px;
  border-radius: 4px;
  border: none;
  font-size: 14px;
  outline: none;
}

.newsletter-form button {
  background-color: #00bfa5;
  border: none;
  padding: 10px 18px;
  color: #fff;
  font-weight: 600;
  cursor: pointer;
  border-radius: 4px;
  transition: background-color 0.3s ease;
}

.newsletter-form button:hover {
  background-color: #2E766F;
}

.footer-contact {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  gap: 40px;
  margin-bottom: 20px;
}

.contact-box {
  display: flex;
  align-items: center;
  gap: 12px;
  color: #ccc;
  text-decoration: none;
  font-size: 16px;
  transition: color 0.3s ease;
}

.contact-box img {
  width: 26px;
  height: 26px;
  filter: brightness(0) invert(1);
  transition: filter 0.3s ease;
}

.contact-box:hover {
  color: #f39c12;
}

.contact-box:hover img {
  filter: brightness(1) invert(0);
}

.footer-bottom {
  text-align: center;
  font-size: 14px;
  color: #777;
  border-top: 1px solid #444;
  padding-top: 15px;
}

.name-link {
    color: #d87e0e;
    text-decoration: none;
    font-weight: 600;
}


.name-link:hover {
    color: #00bfa5;
}



.footer-bottom a {
  color: #00bfa5;
  text-decoration: none;
  font-weight: 600;
  transition: color 0.3s ease;
}

.footer-bottom a:hover {
  color: #d87e0e;
}

/* Responsive */

@media (max-width: 768px) {
  .footer-top {
    flex-direction: column;
  }
  .footer-links {
    flex-direction: column;
  }
  .footer-contact {
    flex-direction: column;
  }
}
</style>



<script>
  document.getElementById("year").textContent = new Date().getFullYear();
</script>

  <!-- End Footer Section -->

  <!-- Scripts -->
  <script src="./files/js/jquery-3.4.1.min.js"></script>
  <script src="./files/js/bootstrap.js"></script>
  <script src="./files/js/custom.js"></script>
