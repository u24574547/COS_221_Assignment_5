<script type='text/javascript' src='js/admin.js'></script>

<section class='hero' >
  <div class='hero-content' >
    <h1 > Admin Management </h1 >
    <p > Search for a user below </p >
    <div class='hero-search' >
      <form action = '' method = 'GET' >
        <input type = 'hidden' name = 'page' value = 'search' >
        <input type = 'text' name = 'query' placeholder = 'Enter user email address' required >
        <button type = 'submit' > Search</button >
      </form >
    </div >
  </div >
  <div class='products-position'>
    <div class='products' id='productsHolder'>
      <h2> User details Editor </h2>
      <form>
        <label for='name'> Name:</label><br>
        <input type='text' id='fname' name='fname' required><br><br>

        <label for='lname'> Surname:</label><br>
        <input type='text' id='lname' name='lname' required><br><br>

        <label for='email'> Email:</label><br>
        <input type='text' id='email' name='email' required><br><br>

        <label for='userType'> User type:</label><br>
        <select name='userType' id="userType">
          <option value='user'>User</option>
          <option value='admin'>Admin</option>
        </select><br><br>

        <input type='button' value='Save Edits' onclick='editUserDetails()'>
      </form>
    </div>
  </div>
</section >
