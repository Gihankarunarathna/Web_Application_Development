
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Page title -->
    <title>Phoenix Airline Portal</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/datatables.net-bs/css/dataTables.bootstrap.min.css" />
 
    
   

</head>
<body class="fixed-navbar sidebar-scroll">
 <div id="loader" class="center"></div> 
       <jsp:include page="dashboard.jsp"/>
       
<div id="wrapper">

<div class="small-header">
    <div class="hpanel">
        <div class="panel-body">
            <div id="hbreadcrumb" class="pull-right">
                <ol class="hbreadcrumb breadcrumb">
                    <li><a href="${pageContext.request.contextPath}/BranchServlet.sales?branch=${sessionScope.Branch}">Dashboard</a></li>
                    
                    <li class="active">
                        <span>Airline Details</span>
                    </li>
                </ol>
            </div>
            <h2 class="font-light m-b-xs">
                Phoenix Airline
            </h2>
            <small>Manage Branches - Users, Flights, Tickets</small>
        </div>
    </div>
</div>

<div class="content">
<div>
    
 <!-- content -->
 <div class="row">
    <div class="col-lg-12">
        <div class="hpanel">
        <div class="panel-heading">
            <div class="panel-tools">
                <a class="showhide"><i class="fa fa-chevron-up"></i></a>
                <a class="closebox"><i class="fa fa-times"></i></a>
            </div>
            Airline Basic Details
        </div>
        <div class="panel-body">
            <form method="get" class="form-horizontal">
                
                 <div class="form-group"><label class="col-sm-2 control-label">Branch</label>

                    <div class="col-sm-10"><input type="text" placeholder="0117234234" value="${branch_detail.getName()}" name="typename" class="form-control" disabled="" required>
                    </div>
                </div>
                <div class="form-group"><label class="col-sm-2 control-label">City</label>

                    <div class="col-sm-10"><input type="text" placeholder="0117234234" value="${branch_detail.getCity()}" name="typename" class="form-control" disabled="" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" >Address</label>
                    <div class="col-sm-10"><textarea   class="form-control"  name="address" placeholder="Address"  disabled="" required>${branch_detail.getAddress()}</textarea></div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" >Contact</label>
                    <div class="col-sm-10"><input type="text" placeholder="0117234234" value="${branch_detail.getContact()}" name="typename" class="form-control" disabled="" required></div>
                </div> 
                <div class="form-group">
                    <label class="col-sm-2 control-label" >Email</label>
                    <div class="col-sm-10"><input type="text" placeholder="branch@gmail.com" value="${branch_detail.getEmail()}" name="typename" class="form-control" disabled="" required></div>
                </div>
                <div class="hr-line-dashed"></div>
                
            </form>
        </div>
        </div>
        </div> 
 </div>
 
<div class="row">
    
    <!--tab component -->
    <div class="col-lg-12">
        <div class="hpanel">
            <div class="nav nav-tabs">
                <% if (request.getSession().getAttribute("Type").toString().equals("Administrator") && request.getSession().getAttribute("BType").toString().equals("Head") ) { %>
                <ul class="nav nav-tabs">
                    
                    <li class="active"><a data-toggle="tab" href="#tab-9">Flights</a></li>
                    <li class=""><a data-toggle="tab" href="#tab-10">Tickets</a></li>
                    <li class=""><a data-toggle="tab" href="#tab-8">System Users</a></li>
                    
                </ul>
                <% } else { %>
                <ul class="nav nav-tabs">
                     <li class="active"><a data-toggle="tab" href="#tab-9">Flights</a></li>
                    <li class=""><a data-toggle="tab" href="#tab-10">Tickets</a></li>
                </ul>
                <% } %>
                <div class="tab-content ">
                    
                    <div id="tab-9" class="tab-pane active">
                        <div class="panel-body">
                              <div class="row " style="padding-bottom:20px;">
                            <div class="col-md-12 text-right">
                                <button class="btn btn-primary " id="CreateVehicle" type="button"><i class="fa fa-plus"></i> New</button>
                            </div>
                        </div>
                          
                    <table id="tblVehicles" class="table table-striped table-bordered table-hover" width="100%">
                        <thead>
                        <tr>
                            <th>Name</th>
                            <th>Model</th>
                            <th>Departure</th>
                            <th># Seats</th>
                            <th>To</th>                           
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        
                        <c:forEach items="${vehicles}" var="vehicle">
                                    <tr>
                                        <td>${vehicle.getName()}</td>
                                        <td>${vehicle.getModel()}</td>
                                        <td><c:out value="${vehicle.getDeparture()}" /></td>
                                        <td><c:out value="${vehicle.getSeats()}" /></td>
                                        <td><c:out value="${vehicle.getTo()}" /></td>
                                        
                                        <td>
                                            <% if (request.getSession().getAttribute("Type").toString().equals("Staff 1")) {%>
                                            <button class="btn btn-primary btn-circle EditVehicle" type="button" data-vehicle='${vehicle.getJson()}'><i class="fa fa-edit"></i></button>
                                            <button class="btn btn-danger btn-circle DeleteVehicle" type="button" id="" data-vehicle='${vehicle.getJson()}'><i class="fa fa-times"  ></i></button>
                                            <button class="btn btn-primary btn-circle ViewVehicle" type="button" id="" data-vehicle='${vehicle.getJson()}'><i class="fa fa-list"  ></i></button>
                                            <% } else { %>
                                            <button class="btn btn-primary btn-circle ViewVehicle" type="button" id="" data-vehicle='${vehicle.getJson()}'><i class="fa fa-list"  ></i></button>
                                            
                                            <% } %>
                                        </td>
                                    </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    </div>
                    </div>
                    
                    <div id="tab-10" class="tab-pane">
                        <div class="panel-body">
                              <div class="row " style="padding-bottom:20px;">
                            <div class="col-md-12 text-right">
                                <button class="btn btn-primary " id="CreateDriver" type="button"><i class="fa fa-plus"></i> New</button>
                            </div>
                        </div>
                          
                    <table id="tblDrivers" class="table table-striped table-bordered table-hover" width="100%">
                        <thead>
                        <tr>
                            <th>Flight</th>
                            <th>Passenger</th>
                            <th>Seat No</th>
                            <th width="15%">Price</th>                     
                            <th width="15%">Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        
                        <c:forEach items="${drivers}" var="driver">
                                    <tr>
                                        <td>${driver.getFlightName()}</td>
                                        <td>${driver.getCustomerName()}</td>
                                        <td><c:out value="${driver.getSeatNo()}" /></td>
                                        <td><c:out value="${driver.getPrice()}" /></td>
                                        <td>
                                            <% if (request.getSession().getAttribute("Type").toString().equals("Staff 1")) {%>
                                            <button class="btn btn-danger btn-circle DeleteDriver" type="button" id="" data-driver='${driver.getJson()}'><i class="fa fa-times"  ></i></button>
                                            <button class="btn btn-primary btn-circle ViewDriver" type="button" id="" data-driver='${driver.getJson()}'><i class="fa fa-list"  ></i></button>
                                            <% } else { %>
                                            <button class="btn btn-primary btn-circle ViewDriver" type="button" id="" data-driver='${driver.getJson()}'><i class="fa fa-list"  ></i></button>
                                            
                                            <% } %>
                                        </td>
                                    </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    </div>
                    </div>
                    
                    <div id="tab-8" class="tab-pane ">
                        <div class="panel-body">
                            
                        <div class="row " style="padding-bottom:20px;">
                            <div class="col-md-12 text-right">
                                <button class="btn btn-primary " id="CreateUser" type="button"><i class="fa fa-plus"></i> New</button>
                            </div>
                        </div>
                          
                    <table id="tblSystemUsers" class="table table-striped table-bordered table-hover" width="100%">
                        <thead>
                        <tr>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Contact</th>
                            <th width="15%">User Type</th>
                            <th width="15%">Actions</th>
                            
                        </tr>
                        </thead>
                        <tbody>
                        
                        <c:forEach items="${systemUsers}" var="user">
                                    <tr>
                                        <td>${user.getUsername()}</td>
                                        <td>${user.getEmail()}</td>
                                        <td><c:out value="${user.getContact()}" /></td>
                                        <td><c:out value="${user.getUserType()}" /></td>
                                        <td>
                                            <button class="btn btn-primary btn-circle EditUser" type="button" data-user='${user.getJson()}'><i class="fa fa-edit"></i></button>
                                            <button class="btn btn-danger btn-circle DeleteUser" type="button" id="" data-user='${user.getJson()}'><i class="fa fa-times"  ></i></button>
                                            <button class="btn btn-primary btn-circle ViewUser" type="button" id="" data-user='${user.getJson()}'><i class="fa fa-list"  ></i></button>
                                            
                                        </td>
                                    </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                     
                        </div>
                    </div>
                    
                    
                    
                    
                    
                </div>

            </div>
        </div>
    </div>
    
   <!--End of tab component -->
    </div>
    
   <!--Create Model Component -->
   <div class="modal fade" id="myModalCreate" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="color-line"></div>
                                <div class="modal-header text-center">
                                    <h4 class="modal-title">Create System User</h4>
                                    <small class="font-bold">System Users Perform the business operations!</small>
                                </div>
                                <div class="modal-body">
                                    
                                        
                                     <!--     -->
                                       <form role="form" id="form_createuser" class="form-horizontal" method="POST" action="${pageContext.request.contextPath}/UserServlet.sales">
                                           <input type="text" value="CreateUser" name="action"  hidden >
                                           <input type="text" value="${branch_detail.getId()}" name="branch"  hidden >
                                           <div class="form-group"><label class="col-sm-2 control-label">User Type<span style="color: red;">*</span></label>

                                                <div class="col-sm-10"><select class="form-control m-b" name="type">
                                                    <option></option>
                                                    <option>Administrator</option>
                                                    <option>Staff 1</option>
                                                    <option>Staff 2</option>
                                                    
                                                </select>
                                                </div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label" >User Name<span style="color: red;">*</span></label>
                                            <div class="col-sm-10"><input type="text" placeholder="User Name" name="username" class="form-control" required></div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label" >NIC<span style="color: red;">*</span></label>
                                            <div class="col-sm-10"><input type="text" placeholder="NIC" name="nic" class="form-control" required></div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label" >Address<span style="color: red;">*</span></label>
                                                <div class="col-sm-10"><textarea   class="form-control"  name="address" placeholder="Address" required></textarea></div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label" >Contact<span style="color: red;">*</span></label>
                                                <div class="col-sm-10"><input type="number" placeholder="Contact" name="contact" class="form-control" required></div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label" >Email<span style="color: red;">*</span></label>
                                                <div class="col-sm-10"><input type="email" placeholder="Email" name="email" class="form-control" required></div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label" >Password<span style="color: red;">*</span></label>
                                                <div class="col-sm-10"><input type="password" placeholder="Password" name="password" id="password1" class="form-control" required></div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label" >Confirm Password<span style="color: red;">*</span></label>
                                                <div class="col-sm-10"><input type="password" placeholder="Confirm Password" name="confirmpassword" id="confirmpassword1" class="form-control" required></div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-sm-8 col-sm-offset-2">
                                                    <button class="btn btn-default" type="button" data-dismiss="modal">Cancel</button>
                                                    <button class="btn btn-primary" type="submit">Save</button>
                                                </div>
                                            </div>
                                        </form>
                                    
                                </div>
                                
                            </div>
                        </div>
                    </div>
   <!-- End of model -->

   <!--Edit Model Component -->
   <div class="modal fade" id="myModalEdit" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="color-line"></div>
                                <div class="modal-header text-center">
                                    <h4 class="modal-title">Edit User Details</h4>
                                    <small class="font-bold">Manage user details!</small>
                                </div>
                                <div class="modal-body">
                                     <form role="form" id="form_edituser" class="form-horizontal" method="POST" action="${pageContext.request.contextPath}/UserServlet.sales">
                                           <input type="text" value="EditUser" name="action"  hidden >
                                           <input type="text" id="eid" name="id"  hidden >
                                           <input type="text" value="${branch_detail.getId()}" name="branch"  hidden >
                                           <input type="text" id="esalt" name="salt"  hidden >
                                           <div class="form-group"><label class="col-sm-2 control-label">User Type<span style="color: red;">*</span></label>

                                                <div class="col-sm-10"><select class="form-control m-b" id="etype" name="type">
                                                    <option>Administrator</option>
                                                    <option>Staff 1</option>
                                                    <option>Staff 2</option>
                                                </select>
                                                </div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label" >User Name<span style="color: red;">*</span></label>
                                                <div class="col-sm-10"><input type="text" placeholder="User Name" id="eusername" name="username" class="form-control" required></div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label" >NIC<span style="color: red;">*</span></label>
                                                <div class="col-sm-10"><input type="text" placeholder="NIC" id="enic" name="nic" class="form-control" required></div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label" >Address<span style="color: red;">*</span></label>
                                                <div class="col-sm-10"><textarea   class="form-control" id="eaddress" name="address" placeholder="Address" required></textarea></div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label" >Contact<span style="color: red;">*</span></label>
                                                <div class="col-sm-10"><input type="number" placeholder="Contact" id="econtact" name="contact" class="form-control" required></div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label" >Email<span style="color: red;">*</span></label>
                                                <div class="col-sm-10"><input type="email" placeholder="Email" id="eemail" name="email" class="form-control" required></div>
                                            </div>
                                           <!-- <div class="form-group"><label class="col-sm-2 control-label" >Password</label>
                                                <div class="col-sm-10"><input type="password" placeholder="Password" id="epassword" name="password" class="form-control" required></div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label" >Confirm Password</label>
                                                <div class="col-sm-10"><input type="password" placeholder="Confirm Password" id="econfirmpassword" name="confirmpassword" class="form-control" required></div>
                                            </div> -->
                                           <div class="form-group"><label class="col-sm-2 control-label">User Status<span style="color: red;">*</span></label>

                                                <div class="col-sm-10"><select class="form-control m-b" id="estatus" name="status">
                                                    <option></option>
                                                    <option value="1">Active</option>
                                                    <option value="0">In Active</option>
                                                </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-sm-8 col-sm-offset-2">
                                                    <button class="btn btn-default" type="button" data-dismiss="modal">Cancel</button>
                                                    <button class="btn btn-primary" type="submit">Save</button>
                                                </div>
                                            </div>
                                        </form>
                                </div>
                                
                            </div>
                        </div>
                    </div>
   <!-- End of model -->
    
   <!--View Model Component -->
   <div class="modal fade" id="myModalView" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="color-line"></div>
                                <div class="modal-header text-center">
                                    <h4 class="modal-title">View System User</h4>
                                    <small class="font-bold">View System User Details!</small>
                                </div>
                                <div class="modal-body">
                                    <form role="form" id="form_createtype" class="form-horizontal">
                                            
                                           <div class="form-group"><label class="col-sm-2 control-label">User Type</label>

                                               <div class="col-sm-10"><select class="form-control m-b" id="vtype" name="type" disabled="">
                                                    <option>Administrator</option>
                                                    <option>Staff 1</option>
                                                    <option>Staff 2</option>
                                                </select>
                                                </div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label" >User Name</label>
                                            <div class="col-sm-10"><input type="text" placeholder="User Name" id="vusername" name="username" class="form-control" disabled="" required></div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label" >NIC</label>
                                            <div class="col-sm-10"><input type="text" placeholder="NIC" id="vnic" name="nic" class="form-control" disabled="" required></div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label" >Address</label>
                                                <div class="col-sm-10"><textarea   class="form-control"  name="address" placeholder="Address" disabled="" required></textarea></div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label" >Contact</label>
                                                <div class="col-sm-10"><input type="number" placeholder="Contact" id="vcontact" name="contact" class="form-control" disabled="" required></div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label" >Email</label>
                                                <div class="col-sm-10"><input type="email" placeholder="Email" id="vemail" name="email" class="form-control" disabled="" required></div>
                                            </div>
                                          <!--  <div class="form-group"><label class="col-sm-2 control-label" >Password</label>
                                                <div class="col-sm-10"><input type="password" placeholder="Password" name="password" class="form-control" required></div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label" >Confirm Password</label>
                                                <div class="col-sm-10"><input type="password" placeholder="Confirm Password" name="confirmpassword" class="form-control" required></div>
                                            </div>  -->
                                            <div class="form-group">
                                                <div class="col-sm-8 col-sm-offset-2">
                                                    <button class="btn btn-default" type="button" data-dismiss="modal">Cancel</button>
                                                    
                                                </div>
                                            </div>
                                        </form>
                                </div>
                                
                            </div>
                        </div>
                    </div>
   <!-- End of model -->

<!-- start of vehicle models -->
    <!--Create Model Component -->
   <div class="modal fade" id="myModalCreateVehicle" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="color-line"></div>
                                <div class="modal-header text-center">
                                    <h4 class="modal-title">Create Flight </h4>
                                    <small class="font-bold">Flights be the key.!</small>
                                </div>
                                <div class="modal-body">
                                    
                                        
                                     <!--     -->
                                       <form role="form" id="form_createvehicle" class="form-horizontal" method="POST" action="${pageContext.request.contextPath}/TransportServlet.sales" >
                                           <input type="text" value="CreateVehicle" name="action"  hidden >
                                           <input type="text" value="${branch_detail.getId()}" name="branch"  hidden >
                                           <div class="form-group"><label class="col-sm-2 control-label">Model Type<span style="color: red;">*</span></label>

                                                <div class="col-sm-10"><select class="form-control m-b" id="cmodel" name="model">
                                                    <option>Flight Type</option>
                                                    <option value="Buoyant flight">Buoyant flight</option>
                                                    <option value="Aerodynamic flight">Aerodynamic flight</option>
                                                    
                                                </select>
                                                </div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label">Departure<span style="color: red;">*</span></label>

                                                <div class="col-sm-10"><select class="form-control m-b" id="ctrnsmission" name="to">
                                                    <option>Select Destination</option>
                                                    <option value="Singapore">Singapore</option>
                                                    <option value="India">India</option>
                                                    <option value="Australia">Australia</option>
                                                    <option value="Canada">Canada</option>
                                                    <option value="US">US</option>
                                                    <option value="Dubai">Dubai</option>
                                                    
                                                </select>
                                                </div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label" >Name<span style="color: red;">*</span></label>
                                            <div class="col-sm-10"><input type="text" placeholder="Flight Name" name="name" class="form-control" required></div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label" >Seats<span style="color: red;">*</span></label>
                                                <div class="col-sm-10"><input type="number"   class="form-control" id="departure"  name="seats"  required></div>
                                            </div>
                                           <div class="form-group"><label class="col-sm-2 control-label" >Departure<span style="color: red;">*</span></label>
                                               <div class="col-sm-10">
                                                   <!--<div class="input-group date" id="datetimepicker1">
                                                        <span class="input-group-addon">
                                                            <span class="fa fa-calendar"></span>
                                                        </span>
                                                    <input type="text" class="form-control"/>
                                                   </div>-->
                                                   <input type="date" placeholder="Departure Date" name="departure" class="form-control" required>
                                               </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-sm-8 col-sm-offset-2">
                                                    <button class="btn btn-default" type="button" data-dismiss="modal">Cancel</button>
                                                    <button class="btn btn-primary" type="submit">Save</button>
                                                </div>
                                            </div>
                                        </form>
                                    
                                </div>
                                
                            </div>
                        </div>
                    </div>
   <!-- End of model -->

   <!--Edit Model Component -->
   <div class="modal fade" id="myModalEditVehicle" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="color-line"></div>
                                <div class="modal-header text-center">
                                    <h4 class="modal-title">Edit Flight </h4>
                                    <small class="font-bold">Flights are the key.!</small>
                                </div>
                                <div class="modal-body">
                                     <form role="form" id="form_editvehicle" class="form-horizontal" method="POST" action="${pageContext.request.contextPath}/TransportServlet.sales">
                                           <input type="text" value="EditVehicle" name="action"  hidden >
                                           <input type="text" id="evid" name="id"  hidden >
                                           <input type="text" value="${branch_detail.getId()}" name="branch"  hidden >
                                           <div class="form-group"><label class="col-sm-2 control-label">Model Type<span style="color: red;">*</span></label>

                                                <div class="col-sm-10"><select class="form-control m-b" id="emodel" name="model">
                                                    <option value=""></option>
                                                    <option value="Buoyant flight">Buoyant flight</option>
                                                    <option value="Aerodynamic flight">Aerodynamic flight</option>
                                                    
                                                </select>
                                                </div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label">Destination<span style="color: red;">*</span></label>

                                                <div class="col-sm-10"><select class="form-control m-b" id="eto" name="to">                                                   
                                                    <option>Select Destination</option>
                                                    <option value="Singapore">Singapore</option>
                                                    <option value="India">India</option>
                                                    <option value="Australia">Australia</option>
                                                    <option value="Canada">Canada</option>
                                                    <option value="US">US</option>
                                                    <option value="Dubai">Dubai</option>
                                                    
                                                </select>
                                                </div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label" >Flight Name<span style="color: red;">*</span></label>
                                                <div class="col-sm-10"><input type="text" placeholder="Flight Name" id="ename" name="name" class="form-control" required></div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label" >Seats<span style="color: red;">*</span></label>
                                                <div class="col-sm-10"><input type="number"   class="form-control" id="eseats" name="seats" required></div>
                                            </div>
                                           <div class="form-group"><label class="col-sm-2 control-label" >Departure<span style="color: red;">*</span></label>                                               <div class="col-sm-10"<input type="date" placeholder="Accuisition Date" name="adate"  class="form-control" required></div>
                                               <div class="col-sm-10">
                                                   <!--<div class="input-group date" id="datetimepicker1">
                                                        <span class="input-group-addon">
                                                            <span class="fa fa-calendar"></span>
                                                        </span>
                                                    <input type="text" class="form-control"/>
                                                   </div>-->
                                                   <input type="date" placeholder="Accuisition Date" name="departure" id="edeparture" class="form-control" required>
                                               </div>
                                            </div>
                                           
                                           
                                            
                                            <div class="form-group">
                                                <div class="col-sm-8 col-sm-offset-2">
                                                    <button class="btn btn-default" type="button" data-dismiss="modal">Cancel</button>
                                                    <button class="btn btn-primary" type="submit">Save</button>
                                                </div>
                                            </div>
                                        </form>
                                </div>
                                
                            </div>
                        </div>
                    </div>
   <!-- End of model -->
    
   <!--View Model Component -->
   <div class="modal fade" id="myModalViewVehicle" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="color-line"></div>
                                <div class="modal-header text-center">
                                    <h4 class="modal-title">View Flight Details</h4>
                                    <small class="font-bold">Flight is the Key.!</small>
                                </div>
                                <div class="modal-body">
                                    <form role="form" id="form_viewvehicle" class="form-horizontal">
                                            
                                           <div class="form-group"><label class="col-sm-2 control-label">Model Type<span style="color: red;">*</span></label>

                                               <div class="col-sm-10"><select class="form-control m-b" id="vmodel" disabled="">
                                                    <option value=""></option>
                                                    <option value="Buoyant flight">Buoyant flight</option>
                                                    <option value="Aerodynamic flight">Aerodynamic flight</option>
                                                    
                                                </select>
                                                </div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label">Destination<span style="color: red;">*</span></label>

                                                <div class="col-sm-10"><select class="form-control m-b" id="vto" disabled="" >                                                   
                                                    <option>Select Destination</option>
                                                    <option value="Singapore">Singapore</option>
                                                    <option value="India">India</option>
                                                    <option value="Australia">Australia</option>
                                                    <option value="Canada">Canada</option>
                                                    <option value="US">US</option>
                                                    <option value="Dubai">Dubai</option>
                                                    
                                                </select>
                                                </div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label" >Flight Name<span style="color: red;">*</span></label>
                                                <div class="col-sm-10"><input type="text" placeholder="Flight Name" id="vname" class="form-control" disabled=""></div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label" >Seats<span style="color: red;">*</span></label>
                                                <div class="col-sm-10"><input type="number"   class="form-control" id="vseats" disabled=""></div>
                                            </div>
                                           <div class="form-group"><label class="col-sm-2 control-label" >Departure<span style="color: red;">*</span></label>                                               <div class="col-sm-10"<input type="date" placeholder="Accuisition Date" name="adate"  class="form-control" required></div>
                                               <div class="col-sm-10">
                                                   <!--<div class="input-group date" id="datetimepicker1">
                                                        <span class="input-group-addon">
                                                            <span class="fa fa-calendar"></span>
                                                        </span>
                                                    <input type="text" class="form-control"/>
                                                   </div>-->
                                                   <input type="date" placeholder="Accuisition Date"  id="vdeparture" class="form-control" disabled="">
                                               </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                <div class="col-sm-8 col-sm-offset-2">
                                                    <button class="btn btn-default" type="button" data-dismiss="modal">Close</button>                              
                                                </div>
                                            </div>
                                        </form>
                                </div>
                                
                            </div>
                        </div>
                    </div>
   <!-- End of model -->   
   
   <!-- Start of Drivers models --> 
    <!--Create Model Component -->
   <div class="modal fade" id="myModalCreateDriver" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="color-line"></div>
                                <div class="modal-header text-center">
                                    <h4 class="modal-title">Create A Flight Ticket</h4>
                                    <small class="font-bold">Enjoy safer Flight with US!</small>
                                </div>
                                <div class="modal-body">
                                    
                                        
                                     <!--     -->
                                       <form role="form" id="form_createdriver" class="form-horizontal" method="POST" action="${pageContext.request.contextPath}/TransportServlet.sales">
                                            <input type="text" value="${branch_detail.getId()}" name="branch"  hidden >
                                            <input type="text" value="CreateDriver" name="action"  hidden >
                                            <div class="form-group"><label class="col-sm-2 control-label" >Flight<span style="color: red;">*</span></label>
                                            <div class="col-sm-10"><select class="form-control m-b" name="fno">
                                                        <option value="">Select A Flight</option>
                                                        
                                                        <c:forEach items="${vehicles}" var="vehicle">                                                      
                                                        <option value="${vehicle.getId()}">${vehicle.getName()}</option>                                                    
                                                        </c:forEach>
                                                        
                                                    
                                                </select></div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label" >Customer<span style="color: red;">*</span></label>
                                            <div class="col-sm-10"><select class="form-control m-b" name="cno">
                                                        <option value="">Select A Customer</option>
                                                        
                                                        <c:forEach items="${cus}" var="item">                                                      
                                                        <option value="${item.getId()}">${item.getName()}</option>                                                    
                                                        </c:forEach>
                                                        
                                                    
                                                </select></div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label" >Price<span style="color: red;">*</span></label>
                                                <div class="col-sm-10"><select class="form-control m-b" name="price">
                                                        <option value="">Select A Ticket Category</option>                   
                                                        <option value="155000">Business Class - 155000 Rs</option>                                                    
                                                        <option value="78000">Normal Class - 78000 Rs</option><!-- comment -->
                                                 
                                                    
                                                </select></div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label" ># Seats<span style="color: red;">*</span></label>
                                                <div class="col-sm-10"><input type="number" name="seatno" required=""></div>
                                            </div>
                                           
                                           
                                            
                                            
                                            <div class="form-group">
                                                <div class="col-sm-8 col-sm-offset-2">
                                                    <button class="btn btn-default" type="button" data-dismiss="modal">Cancel</button>
                                                    <button class="btn btn-primary" type="submit">Save</button>
                                                </div>
                                            </div>
                                        </form>
                                    
                                </div>
                                
                            </div>
                        </div>
                    </div>
   <!-- End of model -->

   
    
   <!--View Model Component -->
   <div class="modal fade" id="myModalViewDriver" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="color-line"></div>
                                <div class="modal-header text-center">
                                    <h4 class="modal-title">View Ticket Info</h4>
                                    <small class="font-bold">Better choice Makes Joy!</small>
                                </div>
                                <div class="modal-body">
                                    <form role="form" id="form_viewdriver" class="form-horizontal">
                                            
                                            <div class="form-group"><label class="col-sm-2 control-label" >Customer</label>
                                                <div class="col-sm-10"><input type="text"  id="vcus" class="form-control" disabled="" required></div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label" >Flight</label>
                                                <div class="col-sm-10"><input type="text" placeholder="NIC" id="vflight" class="form-control" disabled="" required></div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label" >Price</label>
                                                <div class="col-sm-10"><textarea   class="form-control"  id="vprice" placeholder="Address" disabled="" required></textarea></div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label" >Seat</label>
                                                <div class="col-sm-10"><input type="text"   id="vseat" class="form-control" disabled="" required></div>
                                            </div>
                                           
                                           
                                            
                                            
                                            <div class="form-group">
                                                <div class="col-sm-8 col-sm-offset-2">
                                                    <button class="btn btn-default" type="button" data-dismiss="modal">Close</button>
                                                    
                                                </div>
                                            </div>
                                        </form>
                                </div>
                                
                            </div>
                        </div>
                    </div>
   <!-- End of model -->
   
   
   <!-- Start of ORequest models --> 
    <!--Create Model Component -->
   <div class="modal fade" id="myModalCreateORequest" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="color-line"></div>
                                <div class="modal-header text-center">
                                    <h4 class="modal-title">Create Product Request</h4>
                                    <small class="font-bold">Timely Stock requests !</small>
                                </div>
                                <div class="modal-body">
                                    
                                        
                                     <!--     -->
                                       <form role="form" id="form_createORequest" class="form-horizontal">
                                            
                                            <div class="form-group"><label class="col-sm-2 control-label">Product Type</label>

                                                <div class="col-sm-10"><select class="form-control m-b" name="type">
                                                    <option>Type 1</option>
                                                    <option>Type 1</option>
                                                    
                                                </select>
                                                </div>
                                            </div>
                                           <div class="form-group"><label class="col-sm-2 control-label">Product</label>

                                                <div class="col-sm-10"><select class="form-control m-b" name="product">
                                                    <option>Product 1</option>
                                                    <option>Product 2</option>
                                                    
                                                </select>
                                                </div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label" ># Units</label>
                                                <div class="col-sm-10"><input type="number" placeholder="units" name="username" class="form-control" required></div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label">Request Branch</label>

                                                <div class="col-sm-10"><select class="form-control m-b" name="branch">
                                                    <option>Branch 1</option>
                                                    <option>Branch 2</option>
                                                    
                                                </select>
                                                </div>
                                            </div>
                                              
                                           <div class="form-group">
                                                <div class="col-sm-8 col-sm-offset-2">
                                                    <button class="btn btn-default" type="button" data-dismiss="modal">Cancel</button>
                                                    <button class="btn btn-primary" type="button">Add</button>
                                                </div>
                                            </div>
                                           
                                           <div class="hr-line-dashed"></div>
                                           
                                           <table id="orequestItems" class="table table-striped table-bordered table-hover" width="100%">
                                                    <thead>
                                                    <tr>
                                                        <th>Id</th>
                                                        <th>Product Type</th>
                                                        <th>Product</th>
                                                        <th>Requested Branch</th>
                                                        <th># Units</th>
                                                        <th>Date</th>
                                                        
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <tr>
                                                        <td>01</td>
                                                        <td>Type 01</td>
                                                        <td>Product 01</td>
                                                        <td><input type="number" placeholder="units" name="username"  required></td>
                                                        <td>25</td>
                                                        <td>2011/04/25</td>
                                                        
                                                    </tr>
                                                    </tbody>
                                           </table>
                                            
                                            <div class="hr-line-dashed"></div>
                                            
                                            <div class="form-group">
                                                <div class="col-sm-8 col-sm-offset-2">
                                                    <button class="btn btn-default" type="button" data-dismiss="modal">Cancel</button>
                                                    <button class="btn btn-primary" type="submit">Save</button>
                                                </div>
                                            </div>
                                        </form>
                                    
                                </div>
                                
                            </div>
                        </div>
                    </div>
   <!-- End of model -->

   <!--Edit Model Component -->
   <div class="modal fade" id="myModalEditRRequest" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="color-line"></div>
                                <div class="modal-header text-center">
                                    <h4 class="modal-title">Edit Received Request Status</h4>
                                    <small class="font-bold">Better People, Better service !</small>
                                </div>
                                <div class="modal-body">
                                     <form role="form" id="form_createORequest" class="form-horizontal">
                                            
                                            <div class="form-group"><label class="col-sm-2 control-label">Product Type</label>

                                                <div class="col-sm-10"><select class="form-control m-b" name="type" disabled="">
                                                    <option>Type 1</option>
                                                    <option>Type 1</option>
                                                    
                                                </select>
                                                </div>
                                            </div>
                                           <div class="form-group"><label class="col-sm-2 control-label">Product</label>

                                                <div class="col-sm-10"><select class="form-control m-b" name="product" disabled="">
                                                    <option>Product 1</option>
                                                    <option>Product 2</option>
                                                    
                                                </select>
                                                </div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label" ># Units</label>
                                                <div class="col-sm-10"><input type="number" placeholder="units" name="username" class="form-control" disabled="" required></div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label">Requested From</label>

                                                <div class="col-sm-10"><select class="form-control m-b" name="branch" disabled="">
                                                    <option>Branch 1</option>
                                                    <option>Branch 2</option>
                                                    
                                                </select>
                                                </div>
                                            </div>
                                            <div class="hr-line-dashed"></div>
                                            <div class="form-group"><label class="col-sm-2 control-label">Status</label>
                                             <div class="col-sm-10">
                                                    <div class="radio"><label> 
                                                            <input type="radio" checked="" value="option1" id="optionsRadios1" name="optionsRadios"> Accept</label></div>
                                                    <div class="radio"><label> 
                                                            <input type="radio" value="option2" id="optionsRadios2" name="optionsRadios"> Reject</label></div>
                                             </div>
                                            </div>
                                         
                                            <div class="form-group"><label class="col-sm-2 control-label">Assigned Vehicle</label>

                                                <div class="col-sm-10"><select class="form-control m-b" name="branch" >
                                                    <option>Vehicle 1</option>
                                                    <option>Vehicle 2</option>
                                                    
                                                </select>
                                                </div>
                                            </div>
                                              
                                           
                                           
                                           
                                           
                                           
                                            
                                            
                                            
                                            <div class="form-group">
                                                <div class="col-sm-8 col-sm-offset-2">
                                                    <button class="btn btn-default" type="button" data-dismiss="modal">Cancel</button>
                                                    <button class="btn btn-primary" type="submit">Update</button>
                                                </div>
                                            </div>
                                        </form>
                                </div>
                                
                            </div>
                        </div>
                    </div>
   <!-- End of model -->
    
   <!--View Model Component -->
   <div class="modal fade" id="myModalViewORequest" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="color-line"></div>
                                <div class="modal-header text-center">
                                    <h4 class="modal-title">View Own Product Requests</h4>
                                    <small class="font-bold">Better People, Better service !</small>
                                </div>
                                <div class="modal-body">
                                    <form role="form" id="form_createORequest" class="form-horizontal" action="branch.jsp">
                                            
                                            <input type="text" name="orId" id="orId"  hidden >
                                            <table id="orequestItemsList01" class="table table-striped table-bordered table-hover" width="100%">
                                                    <thead>
                                                    <tr>
                                                        
                                                        <th>Index</th>
                                                        <th>Product</th>
                                                        <th>Quantity Requested</th>
                                          
                                                        <th>Status</th>
                                                        
                                                    </tr>
                                                    </thead>
                                                    <tbody id="tblOR1">
                                               
                                                  <!--    -->
                                                            
                                                    </tbody>
                                           </table>
                                            
                                            
                                            <div class="form-group">
                                                <div class="col-sm-8 col-sm-offset-2">
                                                    <button class="btn btn-default" type="button" data-dismiss="modal">Close</button>
                                                    
                                                </div>
                                            </div>
                                        </form>
                                </div>
                                
                            </div>
                        </div>
                    </div>
   <!-- End of model -->
   
   <div class="modal fade" id="myModalViewRRRequest" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="color-line"></div>
                                <div class="modal-header text-center">
                                    <h4 class="modal-title">View Received Product Requests</h4>
                                    <small class="font-bold">Better People, Better service !</small>
                                </div>
                                <div class="modal-body">
                                    <form role="form" id="form_createRRRequest" class="form-horizontal" method="POST" action="${pageContext.request.contextPath}/ProductRequest.sales">
                                            
                                        <input type="text" name="action" value="ChangeRequestStatus"  hidden >
                                        <input type="text" name="id" id="rrid"  hidden >
                                        <input type="text" name="source_branch" id="rrsoucebranch"  hidden>
                                            <table id="rrequestItemsList3" class="table table-striped table-bordered table-hover" width="100%">
                                                    <thead>
                                                    <tr>
                                                        
                                                        <th>Index</th>
                                                        <th>Product</th>
                                                        <th>Quantity Requested</th>
                                          
                                                        <th>Status</th>
                                                        
                                                    </tr>
                                                    </thead>
                                                    <tbody id="tblOR2">
                                                    
                                                
                                                    </tbody>
                                           </table>
                                            
                                            <div class="hr-line-dashed"></div>
                                            <div class="form-group"><label class="col-sm-2 control-label">Status</label>
                                             <div class="col-sm-10">
                                                    <div class="radio"><label> 
                                                            <input type="radio" checked="" value="Approved" id="optionsRadios1" name="status"> Accept</label></div>
                                                    <div class="radio"><label> 
                                                            <input type="radio"  value="Rejected" id="optionsRadios2" name="status"> Reject</label></div>
                                             </div>
                                            </div>
                                         
                                            <div class="form-group"><label class="col-sm-2 control-label">Assigned Vehicle</label>

                                                <div class="col-sm-10"><select class="form-control m-b" name="vehicle" id="rrvehicle" >
                                                    <option>Vehicle 1</option>
                                                    <option>Vehicle 2</option>
                                                    
                                                </select>
                                                </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                <div class="col-sm-8 col-sm-offset-2">
                                                    
                                                    <button class="btn btn-default" type="button" data-dismiss="modal">Cancel</button>
                                                    <button class="btn btn-primary" type="submit">Update</button>
                                                </div>
                                            </div>
                                        </form>
                                </div>
                                
                            </div>
                        </div>
                    </div>
   
   
   
   
   
   
   <!-- start of product models -->
    <!--Create Model Component -->
   <div class="modal fade" id="myModalCreateProduct" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="color-line"></div>
                                <div class="modal-header text-center">
                                    <h4 class="modal-title">Create Product </h4>
                                    <small class="font-bold">Product Price , Stock availability could be defined here.!</small>
                                </div>
                                <div class="modal-body">
                                    
                                        
                                     <!--     -->
                                       <form role="form" id="form_createproduct" class="form-horizontal">
                                            
                                           <div class="form-group"><label class="col-sm-2 control-label">Product Type</label>

                                                <div class="col-sm-10"><select class="form-control m-b" name="type">
                                                    <option>option 1</option>
                                                    <option>option 2</option>
                                                    <option>option 3</option>
                                                    <option>option 4</option>
                                                </select>
                                                </div>
                                            </div>
                                           
                                            <div class="form-group"><label class="col-sm-2 control-label" >Product Name</label>
                                            <div class="col-sm-10"><input type="text" placeholder="Product Name" name="product" class="form-control" required></div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label" >Description</label>
                                                <div class="col-sm-10"><textarea   class="form-control"  name="description" placeholder="Description" required></textarea></div>
                                            </div>
                                           <div class="form-group"><label class="col-sm-2 control-label" >Unit Price</label>
                                               <div class="col-sm-10"><div class="input-group m-b"><span class="input-group-addon">Rs.</span> <input type="number" class="form-control" name="price"> <span class="input-group-addon">.00</span></div></div>
                                            </div>
                                           
                                           <div class="form-group"><label class="col-sm-2 control-label">Supplier</label>

                                                <div class="col-sm-10"><select class="form-control m-b" name="supplier">
                                                    <option>option 1</option>
                                                    <option>option 2</option>
                                                    <option>option 3</option>
                                                    <option>option 4</option>
                                                </select>
                                                </div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label" ># Available Units</label>
                                                <div class="col-sm-10"><input type="number" placeholder="# Units" name="stock" class="form-control" name="units" required></div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-sm-8 col-sm-offset-2">
                                                    <button class="btn btn-default" type="button" data-dismiss="modal">Cancel</button>
                                                    <button class="btn btn-primary" type="submit">Save</button>
                                                </div>
                                            </div>
                                        </form>
                                    
                                </div>
                                
                            </div>
                        </div>
                    </div>
   <!-- End of model -->

   <!--Edit Model Component -->
   <div class="modal fade" id="myModalEditProduct" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="color-line"></div>
                                <div class="modal-header text-center">
                                    <h4 class="modal-title">Edit Product </h4>
                                    <small class="font-bold">Could update Stock details & Price details!</small>
                                </div>
                                <div class="modal-body">
                                     <form role="form" id="form_editproduct" class="form-horizontal">
                                            
                                           <div class="form-group"><label class="col-sm-2 control-label">Product Type</label>

                                                <div class="col-sm-10"><select class="form-control m-b" name="type">
                                                    <option>option 1</option>
                                                    <option>option 2</option>
                                                    <option>option 3</option>
                                                    <option>option 4</option>
                                                </select>
                                                </div>
                                            </div>
                                           
                                            <div class="form-group"><label class="col-sm-2 control-label" >Product Name</label>
                                            <div class="col-sm-10"><input type="text" placeholder="Product Name" name="product" class="form-control" required></div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label" >Description</label>
                                                <div class="col-sm-10"><textarea   class="form-control"  name="description" placeholder="Description" required></textarea></div>
                                            </div>
                                           <div class="form-group"><label class="col-sm-2 control-label" >Unit Price</label>
                                               <div class="col-sm-10"><div class="input-group m-b"><span class="input-group-addon">Rs.</span> <input type="number" class="form-control" name="price"> <span class="input-group-addon">.00</span></div></div>
                                            </div>
                                           
                                           <div class="form-group"><label class="col-sm-2 control-label">Supplier</label>

                                                <div class="col-sm-10"><select class="form-control m-b" name="supplier">
                                                    <option>option 1</option>
                                                    <option>option 2</option>
                                                    <option>option 3</option>
                                                    <option>option 4</option>
                                                </select>
                                                </div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label" ># Available Units</label>
                                                <div class="col-sm-10"><input type="number" placeholder="# Units" name="stock" class="form-control" name="units" required></div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-sm-8 col-sm-offset-2">
                                                    <button class="btn btn-default" type="button" data-dismiss="modal">Cancel</button>
                                                    <button class="btn btn-primary" type="submit">Save</button>
                                                </div>
                                            </div>
                                        </form>
                                </div>
                                
                            </div>
                        </div>
                    </div>
   <!-- End of model -->
    
   <!--View Model Component -->
   <div class="modal fade" id="myModalViewProduct" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="color-line"></div>
                                <div class="modal-header text-center">
                                    <h4 class="modal-title">View Product Details</h4>
                                    <small class="font-bold">Stock details & Price details</small>
                                </div>
                                <div class="modal-body">
                                    <form role="form" id="form_viewproduct" class="form-horizontal">
                                            
                                           <div class="form-group"><label class="col-sm-2 control-label">Product Type</label>

                                               <div class="col-sm-10"><select class="form-control m-b" name="type" disabled="">
                                                    <option>option 1</option>
                                                    <option>option 2</option>
                                                    <option>option 3</option>
                                                    <option>option 4</option>
                                                </select>
                                                </div>
                                            </div>
                                           
                                            <div class="form-group"><label class="col-sm-2 control-label" >Product Name</label>
                                            <div class="col-sm-10"><input type="text" disabled="" placeholder="Product Name" name="product" class="form-control" required></div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label" >Description</label>
                                                <div class="col-sm-10"><textarea disabled=""  class="form-control"  name="description" placeholder="Description" required></textarea></div>
                                            </div>
                                           <div class="form-group"><label class="col-sm-2 control-label" >Unit Price</label>
                                               <div class="col-sm-10"><div class="input-group m-b"><span class="input-group-addon">Rs.</span> <input type="number" class="form-control" disabled="" name="price"> <span class="input-group-addon">.00</span></div></div>
                                            </div>
                                           
                                           <div class="form-group"><label class="col-sm-2 control-label">Supplier</label>

                                                <div class="col-sm-10"><select class="form-control m-b" name="supplier" disabled="">
                                                    <option>option 1</option>
                                                    <option>option 2</option>
                                                    <option>option 3</option>
                                                    <option>option 4</option>
                                                </select>
                                                </div>
                                            </div>
                                            <div class="form-group"><label class="col-sm-2 control-label" ># Available Units</label>
                                                <div class="col-sm-10"><input type="number" placeholder="# Units" name="stock" class="form-control" name="units" disabled="" required></div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-sm-8 col-sm-offset-2">
                                                    <button class="btn btn-default" type="button" data-dismiss="modal">Close</button>
                                                    
                                                </div>
                                            </div>
                                        </form>
                                </div>
                                
                            </div>
                        </div>
                    </div>
   <!-- End of model -->
    
</div>
</div>
</div> 
       
<script src="${pageContext.request.contextPath}/css/jquery-validation/jquery.validate.min.js"></script> 
 <!-- DataTables -->
<script src="${pageContext.request.contextPath}/css/datatables/media/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/css/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<!-- DataTables buttons scripts -->
<script src="${pageContext.request.contextPath}/css/pdfmake/build/pdfmake.min.js"></script>
<script src="${pageContext.request.contextPath}/css/pdfmake/build/vfs_fonts.js"></script>
<script src="${pageContext.request.contextPath}/css/datatables.net-buttons/js/buttons.html5.min.js"></script>
<script src="${pageContext.request.contextPath}/css/datatables.net-buttons/js/buttons.print.min.js"></script>
<script src="${pageContext.request.contextPath}/css/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
<script src="${pageContext.request.contextPath}/css/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
 

 <script>

    $(document).ready(function () {
        //$('#myModal').modal('show');
         var ORID= 0;
         $('input:radio[name="status"]').change(
        function(){
            if ($(this).is(':checked') && $(this).val() == 'Approved') {
                 
                   // $('#rrvehicle').removeAttr('disabled=""');
                    $('#rrvehicle').prop('disabled', false);
            }
            if ($(this).is(':checked') && $(this).val() == 'Rejected') {
                  $('#rrvehicle').prop('disabled', 'disabled');
            }
        });
        
      
        
        
         
         $(document).on("submit", "#form_createvehicle", function(event) {
                var $form = $(this);

                $.post($form.attr("action"), $form.serialize(), function(response) {
                    $('#myModalCreateVehicle').modal('hide');
                    
                    if(response.IsSuccess)
                    {
                        
                      swal({title: "Created!",
                      text: "Flight has been registered!.",
                      type: "success"}, function() {
                            window.location.href = window.location.href
                     });
                    }
                    else
                    {
                       swal("Cancelled", "Something Went Wrong", "error"); 
                    }
                });

                event.preventDefault(); // Important! Prevents submitting the form.
        });
        
        $(document).on("submit", "#form_editvehicle", function(event) {
                var $form = $(this);

                $.post($form.attr("action"), $form.serialize(), function(response) {
                    $('#myModalCreateVehicle').modal('hide');
                    
                    if(response.IsSuccess)
                    {
                      swal({title: "Updated!",
                      text: "Flight details has been updated!.",
                      type: "success"}, function() {
                            window.location.href = window.location.href
                     });
                    }
                    else
                    {
                       swal("Cancelled", "Something Went Wrong", "error"); 
                    }
                });

                event.preventDefault(); // Important! Prevents submitting the form.
        });
        
        $(document).on("submit", "#form_createuser", function(event) {
                var $form = $(this);

                $.post($form.attr("action"), $form.serialize(), function(response) {
                    $('#myModalCreate').modal('hide');
                    
                    if(response.IsSuccess)
                    {
                                          
                      swal({title: "Registered!",
                      text: "User details has been created!.",
                      type: "success"}, function() {
                            window.location.href = window.location.href
                     });
           
                    }
                    else
                    {
                       swal("Cancelled", "Something Went Wrong", "error"); 
                    }
                });

                event.preventDefault(); // Important! Prevents submitting the form.
        });
        
        
        $(document).on("submit", "#form_edituser", function(event) {
                var $form = $(this);

                $.post($form.attr("action"), $form.serialize(), function(response) {
                    $('#myModalEdit').modal('hide');
                    
                    if(response.IsSuccess)
                    {                    
                      swal({title: "Updated!",
                      text: "User details has been updated!.",
                      type: "success"}, function() {
                            window.location.href = window.location.href
                     });
                    }
                    else
                    {
                       swal("Cancelled", "Something Went Wrong", "error"); 
                    }
                });

                event.preventDefault(); // Important! Prevents submitting the form.
        });
        
        $(document).on("submit", "#form_createdriver", function(event) {
                var $form = $(this);

                $.post($form.attr("action"), $form.serialize(), function(response) {
                    $('#myModalCreateDriver').modal('hide');
                    
                    if(response.IsSuccess)
                    {
                      swal({title: "Created!",
                      text: "Ticket has been allocated!.",
                      type: "success"}, function() {
                            window.location.href = window.location.href
                     });
                    }
                    else
                    {
                       swal("Cancelled", "Something Went Wrong", "error"); 
                    }
                });

                event.preventDefault(); // Important! Prevents submitting the form.
        });
        
        $(document).on("submit", "#form_editdriver", function(event) {
                var $form = $(this);

                $.post($form.attr("action"), $form.serialize(), function(response) {
                    $('#myModalEditDriver').modal('hide');
                    
                    if(response.IsSuccess)
                    {                  
                      swal({title: "Updated!",
                      text: "Driver Profile has been updated!.",
                      type: "success"}, function() {
                            window.location.href = window.location.href
                     });
                    }
                    else
                    {
                       swal("Cancelled", "Something Went Wrong", "error"); 
                    }
                });

                event.preventDefault(); // Important! Prevents submitting the form.
        });
        
        $(document).on("submit", "#form_createRRRequest", function(event) {
                var $form = $(this);

                document.querySelector( 
                  "body").style.visibility = "hidden"; 
                document.querySelector( 
                  "#loader").style.visibility = "visible"; 
                $.post($form.attr("action"), $form.serialize(), function(response) {
                    $('#myModalViewRRRequest').modal('hide');
                      document.querySelector( 
                                  "#loader").style.display = "none"; 
                                document.querySelector( 
                                  "body").style.visibility = "visible";
                    if(response.IsSuccess)
                    {
                                           
                      swal({title: "Updated!",
                      text: "Product Request Status has been updated!.",
                      type: "success"}, function() {
                            window.location.href = window.location.href
                     });
           
                    }
                    else
                    {
                       swal("Cancelled", "Your Branch Has No Enough Product Stocks To Approve this Request", "error"); 
                    }
                });

                event.preventDefault(); // Important! Prevents submitting the form.
        });
        
        
        $("#form_createRRRequest").validate({
            rules: {
                
                status: {
                    required: true,                   
                }
               
            }
        });
        
        
        $("#form_createdriver").validate({
            rules: {
                
                fno: {
                    required: true,                   
                },
                cno :{
                    required: true,                   
                },
                price: {
                    required: true,                   
                },
                seatno: {
                    required: true, 
                    
                }
            }
        });
        
        $("#form_editdriver").validate({
            rules: {
                
                fullname: {
                    required: true,                   
                },
                contact: {
                    required: true,                   
                },
                address: {
                    required: true,                   
                },
                nic: {
                    required: true, 
                    
                }
            }
        });
        
        $("#form_createvehicle").validate({
            rules: {
                
                name: {
                    required: true,                   
                },
                to: {
                    required: true,                   
                },
                seats: {
                    required: true,                   
                },
                model: {
                    required: true, 
                    
                },
                departure: {
                    required: true, 
                    
                }           
            }
        });
        
        $("#form_editvehicle").validate({
            rules: {
                
                name: {
                    required: true,                   
                },
                to: {
                    required: true,                   
                },
                seats: {
                    required: true,                   
                },
                model: {
                    required: true, 
                    
                },
                departure: {
                    required: true, 
                    
                } 
            }
        });
        
        
        $("#form_createuser").validate({
            rules: {
                type: {
                    required: true,                   
                },
                nic: {
                    required: true,                   
                },
                username: {
                    required: true,                   
                },
                address: {
                    required: true,                   
                },
                contact: {
                    required: true, 
                    number :true
                },
                email: {
                    required: true, 
                    email: true
                },
                password: {
                    required: true, 
                    equalTo : "#confirmpassword1"
                },
                confirmpassword: {
                    required: true,
                    equalTo : "#password1"
                }
            }
        });
        
        $("#form_edituser").validate({
            rules: {
                type: {
                    required: true,                   
                },
                nic: {
                    required: true,                   
                },
                username: {
                    required: true,                   
                },
                address: {
                    required: true,                   
                },
                contact: {
                    required: true, 
                    number :true
                },
                email: {
                    required: true, 
                    email: true
                },
                password: {
                    required: true, 
                    equalTo : "#confirmpassword"
                },
                confirmpassword: {
                    required: true,
                    equalTo : "#password"
                }
            }
        });
        
        
        
        
        $("#form_createtype").validate({
            rules: {
                typename: {
                    required: true,                   
                }
            },
            submitHandler: function(form) {
                form.submit();
            }
        });
      
        
        $("#form_edittype").validate({
            rules: {
                typename: {
                    required: true,                   
                }
            },
            submitHandler: function(form) {
                form.submit();
            }
        });
    
        $("#form_createproduct").validate({
            rules: {
                type : {
                    required: true,                   
                },
                product : {
                    required: true,                   
                },
                description : {
                    required: true,                   
                },
                price : {
                    required: true, 
                    number: true
                },
                supplier : {
                    required: true,                   
                },
                units : {
                    required: true,
                    number: true
                }
            },
            submitHandler: function(form) {
                form.submit();
            }
        });
        
        $("#form_editproduct").validate({
            rules: {
                type : {
                    required: true,                   
                },
                product : {
                    required: true,                   
                },
                description : {
                    required: true,                   
                },
                price : {
                    required: true, 
                    number: true
                },
                supplier : {
                    required: true,                   
                },
                units : {
                    required: true,
                    number: true
                }
            },
            submitHandler: function(form) {
                form.submit();
            }
        });
        
        
        
       // Attach Button click event listener 
         $('#DeleteType').click(function () {
            swal({
                        title: "Are you sure?",
                        text: "Your will not be able to recover this imaginary file!",
                        type: "warning",
                        showCancelButton: true,
                        confirmButtonColor: "#DD6B55",
                        confirmButtonText: "Yes, delete it!",
                        cancelButtonText: "No, cancel plx!",
                        closeOnConfirm: false,
                        closeOnCancel: false },
                    function (isConfirm) {
                        if (isConfirm) {
                            swal("Deleted!", "Your imaginary file has been deleted.", "success");
                        } else {
                            swal("Cancelled", "Your imaginary file is safe :)", "error");
                        }
                    });
        });
        
        $('.DeleteDriver').click(function () {
            var imageObj = $(this).data('driver');
        swal({
                        title: "Are you sure?",
                        text: "Your will not be able to recover this Ticket Allocation!",
                        type: "warning",
                        showCancelButton: true,
                        confirmButtonColor: "#DD6B55",
                        confirmButtonText: "Yes, delete it!",
                        cancelButtonText: "No, cancel!",
                        closeOnConfirm: false,
                        closeOnCancel: false },
                    function (isConfirm) {
                        if (isConfirm) {
                            
                            
                            var form = $(this).closest('form');
                            form = form.serializeArray();
                            form = form.concat([
                                {name: "id", value:imageObj.Id } ,
                                {name: "action", value:"DeleteDriver" }

                            ]);
                            $.post('${pageContext.request.contextPath}/TransportServlet.sales', form, function(d) {
                                
                                if (d.IsSuccess) {
                                     swal({title: "Deleted!",
                                    text: "Ticket Allocation has been deleted.",
                                    type: "success"}, function() {
                                          window.location.href = window.location.href
                                   });
                                   
                                } else {
                                    swal("Cancelled", "Something Went Wrong!", "error");
                                }
                             });
                            
                        } else 
                        {
                            swal("Cancelled", "Ticket Allocation Saved!", "error");
                        }
                    });
        });
        
        $('.DeleteUser').click(function () {
            var imageObj = $(this).data('user');
            swal({
                        title: "Are you sure?",
                        text: "Your will not be able to recover this User profile!",
                        type: "warning",
                        showCancelButton: true,
                        confirmButtonColor: "#DD6B55",
                        confirmButtonText: "Yes, delete it!",
                        cancelButtonText: "No, cancel plx!",
                        closeOnConfirm: false,
                        closeOnCancel: false },
                    function (isConfirm) {
                       if (isConfirm) {
                            
                            
                            var form = $(this).closest('form');
                            form = form.serializeArray();
                            form = form.concat([
                                {name: "id", value:imageObj.Id } ,
                                {name: "action", value:"DeleteUser" }

                            ]);
                            $.post('${pageContext.request.contextPath}/UserServlet.sales', form, function(d) {
                                
                                if (d.IsSuccess) {
                                   
                                     swal({title: "Deleted!",
                                        text: "Selected User profile has been deleted.",
                                        type: "success"}, function() {
                                              window.location.href = window.location.href
                                       });
                                } else {
                                    swal("Cancelled", "Something Went Wrong!", "error");
                                }
                             });
                            
                        } else 
                        {
                            swal("Cancelled", "User Profile Saved!", "error");
                        }
                    });
        });
        
         $('.DeleteVehicle').click(function () {
             var imageObj = $(this).data('vehicle');
            swal({
                        title: "Are you sure?",
                        text: "Your will not be able to recover this Vehicle profile!",
                        type: "warning",
                        showCancelButton: true,
                        confirmButtonColor: "#DD6B55",
                        confirmButtonText: "Yes, delete it!",
                        cancelButtonText: "No, cancel!",
                        closeOnConfirm: false,
                        closeOnCancel: false },
                    function (isConfirm) {
                        if (isConfirm) {
                            
                            
                            var form = $(this).closest('form');
                            form = form.serializeArray();
                            form = form.concat([
                                {name: "id", value:imageObj.Id } ,
                                {name: "action", value:"DeleteVehicle" }

                            ]);
                            $.post('${pageContext.request.contextPath}/TransportServlet.sales', form, function(d) {
                                
                                if (d.IsSuccess) {
                                    swal({title: "Deleted!",
                                    text: "Vehicle profile has been deleted.",
                                    type: "success"}, function() {
                                          window.location.href = window.location.href
                                   });
                                    
                                } else {
                                    swal("Cancelled", "Something Went Wrong!", "error");
                                }
                             });
                            
                        } else 
                        {
                            swal("Cancelled", "Vehicle Profile Saved!", "error");
                        }
                    });
        });
        
        $('#DeleteORequest').click(function () {
            swal({
                        title: "Are you sure?",
                        text: "Your will not be able to recover this imaginary file!",
                        type: "warning",
                        showCancelButton: true,
                        confirmButtonColor: "#DD6B55",
                        confirmButtonText: "Yes, delete it!",
                        cancelButtonText: "No, cancel plx!",
                        closeOnConfirm: false,
                        closeOnCancel: false },
                    function (isConfirm) {
                        if (isConfirm) {
                            swal("Deleted!", "Your imaginary file has been deleted.", "success");
                        } else {
                            swal("Cancelled", "Your imaginary file is safe :)", "error");
                        }
                    });
        });
        
  $(".RRequest_dispatch").click(function(){    
        var imageObj = $(this).data('rrequest');
        var form = $(this).closest('form');
                            form = form.serializeArray();
                            form = form.concat([
                                {name: "id", value:imageObj.Id } ,
                                {name: "action", value:"ChangeRequestStatus" },
                                {name: "status", value:"Shipping" }
                            ]);
                            $.post('${pageContext.request.contextPath}/ProductRequest.sales', form, function(d) {
                                
                                if (d.IsSuccess) {
                                     swal({title: "Updated!",
                                    text: "Product Request has been dispatched from the branch.",
                                    type: "success"}, function() {
                                          window.location.href = window.location.href
                                   });
                                   
                                } else {
                                    swal("Cancelled", "Something Went Wrong!", "error");
                                }
                             });
                             
});

       $(".RRequest_deliverd").click(function(){  
           var imageObj = $(this).data('rrequest');
        var form = $(this).closest('form');
                            form = form.serializeArray();
                            form = form.concat([
                                {name: "id", value:imageObj.Id } ,
                                {name: "action", value:"ChangeRequestStatus" },
                                {name: "status", value:"Completed" }
                            ]);
                            $.post('${pageContext.request.contextPath}/ProductRequest.sales', form, function(d) {
                                
                                if (d.IsSuccess) {
                                     swal({title: "Updated!",
                                    text: "Product Request has been successfully delivered.",
                                    type: "success"}, function() {
                                          window.location.href = window.location.href
                                   });
                                   
                                } else {
                                    swal("Cancelled", "Something Went Wrong!", "error");
                                }
                             });
                             
     });
        
        $(".RRequest").click(function(){
            
            var imageObj = $(this).data('rrequest');
            
            if(imageObj.Status == 'Pending'){
            $("#rrid").val(imageObj.Id);
            $("#rrsoucebranch").val(imageObj.DestinationBranch);
            
            var form = $(this).closest('form');
            form = form.serializeArray();
                            form = form.concat([  
                                {name: "action", value:"GetFreeVehicles" }
                            ]);
                            $.post('${pageContext.request.contextPath}/TransportServlet.sales', form, function(result) {
                                
                                $("#rrvehicle").children().remove();
                                $("#rrvehicle").append('<option value=""></option>');
                                $.each(result, function (i, item) {
                                    $("#rrvehicle").append("<option value='"+item.Id+"'>"+item.Plate+"</option>");
                                });
                                
                                 
                             });
                             
                    var form = $(this).closest('form');
            form = form.serializeArray();
                            form = form.concat([
                                
                                {name: "action", value: "ridget" },
                                {name: "branch", value: imageObj.SourceBranch},
                                {name: "id", value: imageObj.Id}
                            ]);
                            
                            var table = $('#rrequestItemsList3').DataTable();
                            
                            //$("#orequestItemsList01 > tbody").empty();
                            $("#tblOR2").children().remove();
                           // document.location.href = '${pageContext.request.contextPath}/BranchServlet.sales?branch='+imageObj.DestinationBranch+'&oid='+imageObj.Id;
                            $.post('${pageContext.request.contextPath}/BranchServlet.sales', form, function(result) {
                               console.log(result,"Result here-");
                               $.each(result[0].Objs, function (i, item) {
                                              /*       var component  =  " <tr class='odd' role='row' > "+
                                                                "<td>"+i+"</td>"+

                                                                "<td >"+item.ProductObj[0].ProductName+"</td>"+
                                                                "<td>"+item.Qty+"</td>"+
                                                                "<td>"+result[0].Status+"</td>"+
                                                                
                                                           " </tr>"
                                    $("#tblOR1").append(component);*/
                                    table.row.add( [ i+1, item.ProductObj[0].ProductName, item.Qty,result[0].Status] ).draw().node();
                                });
                                
                                
                                
                                
                             }); 
                             
                             
                             
                             //request locations
                            var form = $(this).closest('form');
                            form = form.serializeArray();
                            form = form.concat([
                                
                                {name: "action", value:"GetLocations" },
                                {name:"id", value: imageObj.Id}

                            ]);
                            $.post('${pageContext.request.contextPath}/BranchServlet.sales', form, function(result) {
                                
                                // initialization of map
                                console.log("Result here for locations",result);
                                 
                             });
                             
                             
                             
                             
                             $('#myModalViewRRRequest').modal('show');
                             
                         }
        else{
                         swal("Cancelled", "You can not change status Again!!!", "error");

}
                         
                         
             // show Modal
            
        });
       
       $("#CreateORequest").click(function(){
            
             // show Modal
             $('#myModalCreateORequest').modal('show');
        });
        
        $("#EditORequest").click(function(){
            
             // show Modal
             $('#myModalEditORequest').modal('show');
        });
        
        $(".ViewORequest").click(function(){
             
             var imageObj = $(this).data('orequest');                 
            var form = $(this).closest('form');
            form = form.serializeArray();
                            form = form.concat([
                                
                                {name: "action", value: "oidget" },
                                {name: "branch", value: imageObj.DestinationBranch},
                                {name: "id", value: imageObj.Id}
                            ]);
                            
                            var table = $('#orequestItemsList01').DataTable();
                            
                            //$("#orequestItemsList01 > tbody").empty();
                            $("#tblOR1").children().remove();
                           // document.location.href = '${pageContext.request.contextPath}/BranchServlet.sales?branch='+imageObj.DestinationBranch+'&oid='+imageObj.Id;
                            $.post('${pageContext.request.contextPath}/BranchServlet.sales', form, function(result) {
                               console.log(result,"Result here-");
                               $.each(result[0].Objs, function (i, item) {
                                              /*       var component  =  " <tr class='odd' role='row' > "+
                                                                "<td>"+i+"</td>"+

                                                                "<td >"+item.ProductObj[0].ProductName+"</td>"+
                                                                "<td>"+item.Qty+"</td>"+
                                                                "<td>"+result[0].Status+"</td>"+
                                                                
                                                           " </tr>"
                                    $("#tblOR1").append(component);*/
                                    table.row.add( [ i+1, item.ProductObj[0].ProductName, item.Qty,result[0].Status] ).draw().node();
                                });
                                
                                
                                
                                
                             });
                             
                             var form = $(this).closest('form');
                            form = form.serializeArray();
                            form = form.concat([
                                
                                {name: "action", value:"GetLocations" },
                                {name:"id", value: imageObj.Id}

                            ]);
                            $.post('${pageContext.request.contextPath}/BranchServlet.sales', form, function(result) {
                                
                                // initialization of map
                                console.log("Result here for locations",result);
                                 
                             });
                             
                             
                             $('#myModalViewORequest').modal('show');
                             //window.location.href = '${pageContext.request.contextPath}/BranchServlet.sales?branch='+imageObj.DestinationBranch+'&oid='+imageObj.Id;
                             
          
        });
       
       
       $("#CreateVehicle").click(function(){
            
             // show Modal
             $('#myModalCreateVehicle').modal('show');
        });
        
        $(".EditVehicle").click(function(){
            var imageObj = $(this).data('vehicle');
             // set modal values
             currentBranch = imageObj.Id;
             
              var form = $(this).closest('form');
            form = form.serializeArray();
                            form = form.concat([
                                
                                {name: "action", value:"GetDriverForVehicle" },
                                {name: "vehicle", value:imageObj.Id }

                            ]);
                            $.post('${pageContext.request.contextPath}/TransportServlet.sales', form, function(result) {
                                 $("#emodel").val(imageObj.Model);
                                $("#ename").val(imageObj.Name);
                                $("#eseats").val(imageObj.Seats);
                                $("#eto").val(imageObj.To);
                               
                                $("#evid").val(imageObj.Id);
                                if(imageObj.Departure != undefined) $("#edeparture").val(imageObj.Departure.split(' ')[0]);
                                // show Modal
                                $('#myModalEditVehicle').modal('show');
                                
                             });
             
        });
        
        $(".ViewVehicle").click(function(){
             
             var imageObj = $(this).data('vehicle');
             // set modal values
             currentBranch = imageObj.Id;
             var form = $(this).closest('form');
            form = form.serializeArray();
                            form = form.concat([
                                
                                {name: "action", value:"GetDriverForVehicle" },
                                {name: "vehicle", value:imageObj.Id }

                            ]);
                            $.post('${pageContext.request.contextPath}/TransportServlet.sales', form, function(result) {
                                 $("#vmodel").val(imageObj.Model);
                                $("#vname").val(imageObj.Name);
                                $("#vseats").val(imageObj.Seats);
                               $("#vto").val(imageObj.To);
                               
                                
                                if(imageObj.Departure != undefined) $("#vdeparture").val(imageObj.Departure.split(' ')[0]);
                                // show Modal
                                $('#myModalViewVehicle').modal('show');
                                
                             });
             
        });
        
        $("#CreateDriver").click(function(){
            
             // show Modal
             $('#myModalCreateDriver').modal('show');
        });
        
        $(".EditDriver").click(function(){
           
        
            var imageObj = $(this).data('driver');
            
            
             // set modal values
             currentBranch = imageObj.Id;
             
             var form = $(this).closest('form');
            form = form.serializeArray();
                            form = form.concat([
                                
                                {name: "action", value:"GetVehicleForDriver" },
                                {name: "driver", value:imageObj.Id }

                            ]);
                            $.post('${pageContext.request.contextPath}/TransportServlet.sales', form, function(result) {
                                 $("#deid").val(imageObj.Id);
                                $("#defullname").val(imageObj.FullName);
                                $("#deaddress").val(imageObj.Address);
                                $("#denic").val(imageObj.NIC);
                                $("#decontact").val(imageObj.Contact);
                                $("#devehicle").val(result);
                                // show Modal
                                $('#myModalEditDriver').modal('show');
                                
                             });
             
            
        });
        
        $(".ViewDriver").click(function(){
             var imageObj = $(this).data('driver');
             // set modal values
             currentBranch = imageObj.Id;
             
              var form = $(this).closest('form');
            form = form.serializeArray();
                            form = form.concat([
                                
                                {name: "action", value:"GetVehicleForDriver" },
                                {name: "driver", value:imageObj.Id }

                            ]);
                            $.post('${pageContext.request.contextPath}/TransportServlet.sales', form, function(result) {
                                 $("#vcus").val(imageObj.customerName);
                                $("#vflight").val(imageObj.flightName);
                                $("#vprice").val(imageObj.price);
                                $("#vseat").val(imageObj.seatNo);
                                                               // show Modal
                                $('#myModalViewDriver').modal('show');
                                
                             });
             
             
            
        });
        
       
        $("#CreateProduct").click(function(){
            
             // show Modal
             $('#myModalCreateProduct').modal('show');
        });
        
        $("#EditProduct").click(function(){
            
             // show Modal
             $('#myModalEditProduct').modal('show');
        });
        
        $("#ViewProduct").click(function(){
             
             // show Modal
             $('#myModalViewProduct').modal('show');
        });
        
        
        $(".ViewUser").click(function(){
             var imageObj = $(this).data('user');
             // set modal values
             //currentBranch = imageObj.Id;
             $("#vusername").val(imageObj.Username);
             $("#vcontact").val(imageObj.Contact);
             $("#vaddress").val(imageObj.Address);
             $("#vemail").val(imageObj.Email);
             $("#vnic").val(imageObj.NIC);
             $("#vtype").val(imageObj.UserType);
             $("#salt").val(imageObj.Salt);
             $("#vid").val(imageObj.Id);
             $("#vpassword").val(imageObj.Password);
             $("#confirmpassword").val(imageObj.Password);
             $('#myModalView').modal('show');
        });
        
        
        $("#CreateUser").click(function(){
 
             $('#myModalCreate').modal('show');
        });
        
        $(".EditUser").click(function(){
             
             var imageObj = $(this).data('user');
             // set modal values
             //currentBranch = imageObj.Id;
             $("#eusername").val(imageObj.Username);
             $("#econtact").val(imageObj.Contact);
             $("#eaddress").val(imageObj.Address);
             $("#eemail").val(imageObj.Email);
             $("#enic").val(imageObj.NIC);
             $("#etype").val(imageObj.UserType);
             $("#esalt").val(imageObj.Salt);
             $("#eid").val(imageObj.Id);
             $("#epassword").val(imageObj.Password);
             $("#econfirmpassword").val(imageObj.Password);
             $("#estatus").val(imageObj.Status);
             
             $('#myModalEdit').modal('show');
        });
        
        $(function () {

      

        // Initialize Example 1
        $('#tblSystemUsers').dataTable( {
         //   "ajax": '${pageContext.request.contextPath}/api/datatables.json',
            
            dom: "<'row'<'col-sm-4'l><'col-sm-4 text-center'B><'col-sm-4'f>>tp",
            "lengthMenu": [ [10, 25, 50, -1], [10, 25, 50, "All"] ],
            buttons: [
                {extend: 'copy',className: 'btn-sm'},
                {extend: 'csv',title: 'ExampleFile', className: 'btn-sm'},
                {extend: 'pdf', title: 'ExampleFile', className: 'btn-sm'},
                {extend: 'print',className: 'btn-sm'}
            ]
           
        });
        
        $('#tblVehicles').dataTable( {
         //   "ajax": '${pageContext.request.contextPath}/api/datatables.json',
            
            dom: "<'row'<'col-sm-4'l><'col-sm-4 text-center'B><'col-sm-4'f>>tp",
            "lengthMenu": [ [10, 25, 50, -1], [10, 25, 50, "All"] ],
            buttons: [
                {extend: 'copy',className: 'btn-sm'},
                {extend: 'csv',title: 'ExampleFile', className: 'btn-sm'},
                {extend: 'pdf', title: 'ExampleFile', className: 'btn-sm'},
                {extend: 'print',className: 'btn-sm'}
            ]
           
        });

           
          $('#tblDrivers').dataTable( {
         //   "ajax": '${pageContext.request.contextPath}/api/datatables.json',
            
            dom: "<'row'<'col-sm-4'l><'col-sm-4 text-center'B><'col-sm-4'f>>tp",
            "lengthMenu": [ [10, 25, 50, -1], [10, 25, 50, "All"] ],
            buttons: [
                {extend: 'copy',className: 'btn-sm'},
                {extend: 'csv',title: 'ExampleFile', className: 'btn-sm'},
                {extend: 'pdf', title: 'ExampleFile', className: 'btn-sm'},
                {extend: 'print',className: 'btn-sm'}
            ]
           
        });
        
        $('#tblORequest').dataTable( {
         //   "ajax": '${pageContext.request.contextPath}/api/datatables.json',
            
            dom: "<'row'<'col-sm-4'l><'col-sm-4 text-center'B><'col-sm-4'f>>tp",
            "lengthMenu": [ [10, 25, 50, -1], [10, 25, 50, "All"] ],
            buttons: [
                {extend: 'copy',className: 'btn-sm'},
                {extend: 'csv',title: 'ExampleFile', className: 'btn-sm'},
                {extend: 'pdf', title: 'ExampleFile', className: 'btn-sm'},
                {extend: 'print',className: 'btn-sm'}
            ]
           
        });
        
        $('#tblRRequest').dataTable( {
         //   "ajax": '${pageContext.request.contextPath}/api/datatables.json',
            
            dom: "<'row'<'col-sm-4'l><'col-sm-4 text-center'B><'col-sm-4'f>>tp",
            "lengthMenu": [ [10, 25, 50, -1], [10, 25, 50, "All"] ],
            buttons: [
                {extend: 'copy',className: 'btn-sm'},
                {extend: 'csv',title: 'ExampleFile', className: 'btn-sm'},
                {extend: 'pdf', title: 'ExampleFile', className: 'btn-sm'},
                {extend: 'print',className: 'btn-sm'}
            ]
           
        });
        // Initialize Example 2
        $('#rrequestItemsList3').dataTable();
        $('#orequestItemsList01').dataTable();
        
        


    });
    
        
    });
    


</script>     
       
</body>
</html>
