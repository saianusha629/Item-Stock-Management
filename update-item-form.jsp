<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>update item</title>
  <link rel="stylesheet" href="css/font-awesome.min.css">
  <link rel="stylesheet" href="css/bootstrap.css">
  <link rel="stylesheet" href="css/style.css">
</head>
<body>
  <nav class="navbar navbar-expand-sm navbar-dark bg-dark p-0">
    <div class="container">
      <a href="https://xcelerator.ninja" class="navbar-brand">xcelerator</a>
      <button class="navbar-toggler" data-toggle="collapse" data-target="#navbarNav">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
          <li class="nav-item px-2">
            <a href="StockControllerServlet" class="nav-link">Dashboard</a>
          </li>
          </ul>

        <ul class="navbar-nav ml-auto">
          <li class="nav-item dropdown mr-3">
            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-user"></i> Welcome Team2
            </a>
            <div class="dropdown-menu">
              <a href="profile.html" class="dropdown-item">
                <i class="fa fa-user-circle"></i> Profile
              </a>
              <a href="#" class="dropdown-item">
                <i class="fa fa-gear"></i> Settings
              </a>
            </div>
          </li>
          <li class="nav-item">
            <a href="login.html" class="nav-link">
              <i class="fa fa-user-times"></i> Logout
            </a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <header id="main-header" class="py-2 bg-warning text-white">
    <div class="container">
      <div class="row">
        <div class="col-md-6">
           <img src="img/icon.png" class="rounded float-left" alt="sanjeev"><h1> Update Item</h1>
        </div>
      </div>
    </div>
  </header>

  <!-- PROFILE EDIT -->
  <section id="profile">
    <div class="container">
      <div class="row">
        <div class="col-md-8 mx-auto">
          <div class="card">
           
            <div class="card-body">
            
            <form action="StockControllerServlet" method="GET" name="item">
		
			<input type="hidden" name="command" value="UPDATE" />

			<input type="hidden" name="itemCode" value="${THE_STUDENT.itemCode}" />
			
			
                <div class="form-group">
                
                <label>Item Name:</label>
				<input type="text" name="itemName"  class="form-control" value="${THE_STUDENT.itemName }" />
				<label>Unit:</label>
				<input type="text" name="unit" class="form-control" value="${THE_STUDENT.unit }" />
					
				<label>Beginning Inventory:</label>
						<input type="text" name="beginningInventory" class="form-control" value="${THE_STUDENT.beginningInventory }" />
					
						<label>Quantity on Hand:</label>
						<input type="text" name="qunatityOnHand" class="form-control" value="${THE_STUDENT.qunatityOnHand }" />
					<label>Price per Unit:</label>
				<input type="text" name="pricePerUnit" class="form-control" value="${THE_STUDENT.pricePerUnit }" />
					<label>Date Of Manufacture:</label>
						<input type="text" name="dateOfManufacture" class="form-control" value="${THE_STUDENT.dateOfManufacture }"  />
					
						<label>Date of Expiry:</label>
						<input type="text" name="dateOfExpiry" class="form-control" value="${THE_STUDENT.dateOfExpiry }" />
						<label></label>
						
						<button class="btn btn-success btn-block" type="submit" class="form-control">UPDATE</button>			
                  
                  <label></label>
                  <p>
			<a href="StockControllerServlet">Back to List</a>
		</p>
                </div>
               </form>
            </div>
          </div>
        </div>
       
      </div>
    </div>
  </section>

  <footer id="main-footer" class="bg-dark text-white mt-5 p-5">
    <div class="conatiner">
      <div class="row">
        <div class="col">
          <p class="lead text-center">Copyright &copy; 2018 xcelerator</p>
        </div>
      </div>
    </div>
  </footer>

  <script src="js/jquery.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="https://cdn.ckeditor.com/4.7.1/standard/ckeditor.js"></script>
  <script>
      CKEDITOR.replace( 'editor1' );
  </script>
</body>
</html>
