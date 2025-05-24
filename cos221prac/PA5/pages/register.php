<script type="text/javascript" src="js/register.js"></script>

<?php
?>
<div class='products-position'>
  <div class='products' id='productsHolder'>
  <h2> Sign-up Form </h2>
  <form>
    <label for='name'> Name:</label><br>
    <input type='text' id='fname' name='fname' required><br><br>

    <label for='lname'> Surname:</label><br>
    <input type='text' id='lname' name='lname' required><br><br>

    <label for='email'> Email:</label><br>
    <input type='text' id='email' name='email' required><br><br>

    <label for='password'> Password:</label><br>
    <input type='password' id='password' name='password' required><br><br>

    <input type='button' value='Sign Up' onclick="register()">
  </form>
  </div>
</div>
