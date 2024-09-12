<%@include file="header.jsp" %>
<div class="container">
	<div id="myCarousel" class="carosel slide" data-ride="carousel">
	<ol class="carousel-indicators">
		<li data-target="#myCarosel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarosel" data-slide-to="1"></li>
		<li data-target="#myCarosel" data-slide-to="2"></li>
	</ol>
	
	<div class="carousel-inner">
		<div class="item active">
			<img src="images\b1.jpg" alt="Chaina" style="width:100%;height:400px">
			<div class="carousel-caption">
			
			</div>
		</div>
		<div class="item">
			<img src="images\b2.jpg" alt="Chaina" style="width:100%;height:400px">
			<div class="carousel-caption">
			
			</div>
		</div>
		<div class="item">
			<img src="images\b3.jpg" alt="Chaina" style="width:100%;height:400px">
			<div class="carousel-caption">
			
			</div>
		</div>
	</div>
	</div>
	
	<a class="Left carousel-control" href="#myCarousel" data-slide="prev">
		<span class="glyphicon glyphicon-chevron-left"></span>
		<span class="sr-only">Previous</span>
	</a>
	<a class="right carousel-control" href="#myCarousel" data-slide="next">
		<span class="glyphicon glyphicon-chevron-right"></span>
		<span class="sr-only">Next</span>
	</a>
</div>
<jsp:include page="footer.jsp"></jsp:include>