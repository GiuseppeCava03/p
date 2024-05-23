<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="model.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Header</title>
<link rel="stylesheet" href="./css/header.css">

	<% 
        response.setHeader("Content-Security-Policy", "frame-ancestors 'self';");
        response.setHeader("X-Frame-Options", "SAMEORIGIN");
    %>
</head>
<body>
	<header>
	
        <div class="left-nav">
            <ul>
                <li>
                    <div class="home">
                        <a href="index.jsp"><img src="./img/icone/home-ico.png"></a>
                        <a class="a-header" href="index.jsp">&lt;home/&gt;</a>
                    </div>
                </li>
                <li>
                    <div class="cart">
                        <a href="cart.jsp"><img src="./img/icone/carello-ico.png"></a>
                        <a class="a-header" href="cart.jsp">&lt;carrello/&gt;</a>
                    </div>
                </li>
            </ul>
        </div>
        
        
         <div class="logo" >
            <img src="./img/logotswww.png" class ="logohome">
        </div>
        
                  
        <div class="right-nav">
        
          <ul>
           
             <% if (session.getAttribute("registeredUser") != null) {
					UserBean bean = (UserBean) session.getAttribute("registeredUser");
					if (bean.getEmail().compareTo("") != 0) {
			 %>
           
               
                
                <%
			 			if (bean.getRole().compareTo("admin") == 0) {
			 %>
			  
			 	<li>
                    <div class="account">
                        <a href="admin-hub.jsp"><img src="./img/icone/account-ico.png"></a>
                         <a class="a-header" href="admin-hub.jsp">&lt;admin/&gt;</a>
                    </div>
                </li>
                
                 <%			}
			 			else {
			 %>
			 
              
                <li>
                    <div class="account">
                        <a href="account.jsp"><img src="./img/icone/account-ico.png"></a>
                        <a class="a-header" href="account.jsp">&lt;account/&gt;</a>
                    </div>
                </li>

             <%			}
			 %>
			  <li>
                    <div class="favs">
                        <a href="preferiti.jsp"><img src="./img/icone/top-ico.png"></a>
                        <a class="a-header" href="preferiti.jsp">&lt;preferiti/&gt;</a>
                    </div>
                </li>
			 <% }
			 	else {
			 %>
				<li>
                    <div class="favs">
                        <a href="preferiti.jsp"><img src="./img/icone/top-ico.png"></a>
                        <a class="a-header" href="loginPage.jsp">&lt;preferiti/&gt;</a>
                    </div>
                </li>
			  
			   
			 	<li>
                    <div class="account">
                        <a href="loginPage.jsp"><img src="./img/icone/account-ico.png"></a>
                        <a class="a-header" href="loginPage.jsp">&lt;accedi/&gt;</a>
                    </div>
                </li>
                
               
			 <% }
			 }
			 
			 else {
			 %>
			
			 <li>
                    <div class="favs">
                        <a href="preferiti.jsp"><img src="./img/icone/top-ico.png"></a>
                        <a class="a-header" href="preferiti.jsp">&lt;preferiti/&gt;</a>
                    </div>
                </li>
			  
			  	<li>
                    <div class="account">
                        <a href="loginPage.jsp"><img src="./img/icone/account-ico.png"></a>
                        <a class="a-header" href="loginPage.jsp">&lt;accedi/&gt;</a>
                    </div>
                </li>
			
			 <%
			 }
			 %>
			 
			 </ul> 

        </div>
         
        
    </header>
   	<script src="script/jquery.js"></script>
	<script>
		$(document).ready(function(){
			$(".logo").hover(function() {
				$(this).css("transform", "scale(-1.01)");
			}, function() {
				$(this).css("transform", "scale(1)");
			});
		});
	</script>	  
</body>
</html>