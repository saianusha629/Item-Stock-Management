<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*,com.sanjeevtech.model.Stock" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Item Stock Management</title>
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
            <a href="StockControllerServlet" class="nav-link active">Dashboard</a>
          </li>
             
        </ul>

        <ul class="navbar-nav ml-auto">
          <li class="nav-item dropdown mr-3">
            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-user"></i> Welcome TEAM1
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
         <img src="img/icon.png" class="rounded float-left" alt="sanjeev"> <h1>Item Stock Management</h1>
        </div>
      </div>
    </div>
  </header>

  <!-- ACTIONS -->
  <section id="action" class="py-4 mb-4 bg-dark">
    <div class="container">
      <div class="row">
        <div class="col-md-3">
          <a href="#" class="btn btn-primary btn-block" data-toggle="modal" data-target="#addPostModal">
            <i class="fa fa-plus"></i> Add Description
          </a>
        </div>
        <div class="col-md-3">
          <a href="#" class="btn btn-success btn-block" data-toggle="modal" data-target="#addUserModal">
            <i class="fa fa-plus"></i> Add Item
          </a>
        </div>
        <div class="col-md-6 ml-auto">
        
        <form action="StockControllerServlet" method="get">
		<input type="hidden" name="command" value="SEARCH" />
        
          <div class="input-group">
            <input type="text" class="form-control" name="theSearchName" placeholder="Item Name">
            <span class="input-group-btn">
              <button class="btn btn-success" type="submit">Search</button>
            </span>
          </div>
          
          </form>
          
          
        </div>
      </div>
    </div>
  </section>

  <!-- POSTS -->
 
  
  
  
  <section id="posts">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="card">
            <div class="card-header">
              <h4>Items</h4>
            </div>
            <table class="table table-hover">
              <thead class="thread-dark">
               <tr>
					<th>ItemName</th>
					<th>Unit</th>
					<th>QuantityOnHand</th>
					<th>PricePerUnit</th>
					<th>DateOfManufacture</th>
					<th>DateOfExpiry </th>
					<th>Location</th>
					<th>Action</th>
				</tr>
                
              </thead>
              <tbody>
              <c:forEach var="tempStock" items="${STOCK_LIST}">
					
					<!-- set up a link for each student -->
					<c:url var="tempLink" value="StockControllerServlet">
						<c:param name="command" value="LOAD" />
						<c:param name="itemCode" value="${tempStock.itemCode}" />
					</c:url>

					<!--  set up a link to delete a student -->
					<c:url var="deleteLink" value="StockControllerServlet">
						<c:param name="command" value="DELETE" />
						<c:param name="itemCode" value="${tempStock.itemCode}" />
					</c:url>
																		
					<tr class="table-success">
						<td scope="row"> ${tempStock.itemName} </td>
						<td> ${tempStock.unit} </td>
						<td> ${tempStock.qunatityOnHand} </td>
						<td> ${tempStock.pricePerUnit} </td>
						<td> ${tempStock.dateOfManufacture} </td>
						<td> ${tempStock.dateOfExpiry} </td>
						<td> ${tempStock.location} </td>
						<td> 
							<a href="${tempLink}">Update</a>|<a href="${deleteLink}" onclick="if (!(confirm('Are you sure you want to delete this item?'))) return false">Delete</a>	
						</td>
					</tr>
				
				</c:forEach>
              
              
              
                             </tbody>
            </table>
          </div>
        </div>
        
      </div>
    </div>
  </section>

  <footer id="main-footer" class="bg-dark text-white mt-5 p-5">
    <div class="conatiner">
      <div class="row">
        <div class="col">
          <p class="lead text-center">Copyright &copy; 2018 xcelerator.ninja</p>
        </div>
      </div>
    </div>
  </footer>


  <!-- POST MODAL -->
  <div class="modal fade" id="addPostModal">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header bg-primary text-white">
          <h5 class="modal-title">Add Description</h5>
          <button class="close" data-dismiss="modal"><span>&times;</span></button>
        </div>
        <div class="modal-body">
          <form>
            <div class="form-group">
              <label for="title">Item Name</label>
              <input type="text" class="form-control">
            </div>
            <div class="form-group">
              <label for="category">Category</label>
              <select class="form-control">
                <option value="">Pharma Drug</option>
                <option value="">Health and Personal Care</option>
                <option value="">Baby Care</option>
                <option value="">Medical Supplies and Equipments</option>
              </select>
            </div>
            <div class="form-group">
              <label for="file">Image Upload</label>
              <input type="file" class="form-control-file">
              <small class="form-text text-muted">Max Size 3mb</small>
            </div>
            <div class="form-group">
              <label for="body">Body</label>
              <textarea name="editor1" class="form-control"></textarea>
            </div>
          </form>
        </div>
        <div class="modal-footer">
          <button class="btn btn-secondary" data-dismiss="modal">Close</button>
          <button class="btn btn-primary" data-dismiss="modal">Save Changes</button>
        </div>
      </div>
    </div>
  </div>


  <!-- CATEGORY MODAL -->
  <div class="modal fade" id="addCategoryModal">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header bg-success text-white">
          <h5 class="modal-title">Add Category</h5>
          <button class="close" data-dismiss="modal"><span>&times;</span></button>
        </div>
        <div class="modal-body">
          <form>
            <div class="form-group">
              <label for="title">Title</label>
              <input type="text" class="form-control">
            </div>
          </form>
        </div>
        <div class="modal-footer">
          <button class="btn btn-secondary" data-dismiss="modal">Close</button>
          <button class="btn btn-success" data-dismiss="modal">Save Changes</button>
        </div>
      </div>
    </div>
  </div>

  <!-- USER MODAL -->
  <div class="modal fade" id="addUserModal">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header bg-warning text-white">
          <h5 class="modal-title">Add Item</h5>
          <button class="close" data-dismiss="modal"><span>&times;</span></button>
        </div>
        
        
        
        <form action="StockControllerServlet" method="POST" name="item">
		
			<input type="hidden" name="command" value="ADD" />
        <div class="modal-body">
          
            <div class="form-group">
              <label for="name">ItemName</label>
              <input type="text" name="itemName" required="required" placeholder="Item Name" class="form-control" pattern="[a-zA-Z0-9\s\.]+"/>
              </div>
            <div class="form-group">
              <label for="email">Unit</label>
              <input type="text" name="unit" required="required" placeholder="Eg 250 ml, 50 mg, 100 pcs" class="form-control"/>
            </div>
            <div class="form-group">
              <label for="name">BeginningInventory</label>
              <input type="number" name="beginingInventory" required="required" placeholder="Beginning Inventory" class="form-control"/>
            </div>
            <div class="form-group">
              <label for="name">QuantityOnHand</label>
              <input type="number" name="qunatityOnHand" required="required" placeholder="Quantity On Hand" class="form-control"/>
            </div>
            
            <div class="form-group">
              <label for="name">PricePerUnit</label>
              <input type="number" name="pricePerUnit" required="required" placeholder="Price Per Unit" step="0.01" class="form-control"/>
            </div>
             <div class="form-group">
              <label for="name">DateOfManufacture</label>
              <input type="date" name="dateOfManufacture" required="required" class="form-control" />
            </div>
              <div class="form-group">
              <label for="name">DateOfExpiry</label>
              <input type="date" name="dateOfExpiry" required="required" class="form-control"/>
            </div>
             <div class="form-group">
              <label for="name">Location</label>
              <select name="location" class="form-control">
						<option>Bulk Zone</option>
						<option>Pick Zone</option>
						<option>Distribution Center</option>
						</select>
            </div>
            
            <div class="form-group">
              <label for="name">Category</label>
              <select name="itemCategory" class="form-control">
						<option>Pharma Drug</option>
						<option>Health and Personal Care</option>
						<option>Baby Care </option>
						<option>Medical Supplies and Equipments</option>
						</select>
            </div>
            
            <div class="form-group">
              <label for="name">SubCategory</label>
              <select name="itemSubCategory" class="form-control">
						<option>Tablet</option>
						<option>Capsule</option>
						<option>Syrup</option>
						<option>Cream and Lotion</option>
						<option>Powders</option>
						<option>Hand and Foot Care</option>
						<option>Sun Care</option>
						<option>Face Pack and Cleanser</option>
						<option>Diaper and Wipe</option>
						<option>Soap</option>
						<option>Baby Powder</option>
						<option>Cereal and Formula Food Powder</option>
						<option>Medical Monitor</option>
						<option>Diagnostic</option>
						<option>Surgical Instrument</option>
						</select>
            </div>
            
         
        </div>
        <div class="modal-footer">
          <button class="btn btn-secondary" data-dismiss="modal">Close</button>
          <button class="btn btn-warning" type="submit">Add Item</button>
          
        </div>
         </form>
      </div>
    </div>
  </div>

  <script src="js/jquery.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="https://cdn.ckeditor.com/4.7.1/standard/ckeditor.js"></script>
  <script>
      CKEDITOR.replace( 'editor1' );
  </script>
</body>
</html>
