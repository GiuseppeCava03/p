<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="model.ProductBean, java.text.DecimalFormat"%>
<% 
	ProductBean prodotto = null;
	if (request.getAttribute("prodottoDettaglio") == null) {
		response.sendRedirect("./ProductControl?action=dettaglio&codice=" + request.getParameter("codice"));	
		return;
	}
	else {
		prodotto = (ProductBean) request.getAttribute("prodottoDettaglio");
	}		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="css/dettagli.css">
<link rel="icon" href="./img/icon.png">
<title>Geek Factory - Prodotto</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
	
	<section class="container sproduct" style="margin-bottom: 190px; margin-top: 120px">
		<div class="row mt-5">
			<div></div>
			<div class="col1">
				<%
					String immagine = "img/productIMG/" + prodotto.getImmagine();
				%>
				<img class="imgProduct" src="<%=immagine%>" alt="">
			</div>
			<div class="col2">
				<h6><%=prodotto.getTipologia()%> / <%=prodotto.getTag() %></h6>
				<h3 class="nome"><%=prodotto.getNome()%></h3>
				
				<ul class = "rating" style="padding: 0">
							<%
							double votazione = prodotto.getVotazione();
							int count = 0;
							
							if (votazione >= 1) {
							while (votazione >= 1) {
								if (votazione >= 2) {
									votazione = votazione - 2;
									count += 1;
							%>
							<li><i class = "fas fa-star"></i></li>
							<%  } 
								else if (votazione >= 1) {
									votazione = votazione - 1;
									count += 1;
							%>
							<li><i class = "fas fa-star-half-alt"></i></li>
							<% }
							}
							}
							else {
								count += 1;
							%>
							<li><i class = "far fa-star"></i></li>
							<%
							}
							while (count != 5) {
								count++;
							%>
							<li><i class = "far fa-star"></i></li>
							<%
							}
							%>
				</ul>
					
				
				<%
					Double tot = prodotto.getPrezzo() + prodotto.getSpedizione();
					DecimalFormat df = new DecimalFormat("0.00");
					String prezzoTot = df.format(tot);
					
					
				%>
				<h2><%=prezzoTot%>&euro;</h2>
				<a href="CartControl?action=aggiungi&codice=<%=prodotto.getCodice()%>"><button class="buy-btn" style="margin-bottom: 20px; cursor: pointer">Aggiungi al carrello</button></a>
				<h3 class="desc" style="font-size: 1.3em">Descrizione prodotto  <i class="fa-solid fa-indent" style="color: #000000"></i></h3>
				<p><%=prodotto.getDescrizione()%></p>
			</div>
			<div></div>
		</div>
	</section>
	
	<jsp:include page="footer.jsp"/>
</body>
</html>