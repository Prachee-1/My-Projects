<%@ include file="header.jsp" %>
<<style>
body{
background-color:grey;
}
</style>

<div class="container">
<div class="col-md-3">
<div id="myCarousel" class="carousel slide" data-ride="carousel">
<!----Indicators---->
<ol class="carousel-indicators">
<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
<li data-target="#myCarousel" data-slide-to="1" ></li>
<li data-target="#myCarousel" data-slide-to="2"></li>
</ol>

<!-----Wrapper for slides---->
<div class="carousel-inner">

<div class="item active">
<img src="..\images\b1.jpg" alt="lab" style= "width:100% ;height:400px">
</div>

<div class="item ">
<img src="..\images\b2.jpg" alt="lab" style="width:100%; height:400px">
</div>

<div class="item">
<img src="..\images\b3.jpg" alt="lab" style="width:100%; height:400px">
</div>

</div>

<!-----left and right controls---> 
<a class="left carousel-control" href="#myCarousel" data-slide="prev">
<span class="glyphicon glyphicon-chevron-left"></span>
<span class="sr-only">Previous</span></a>

<a class="right carousel-control" href="#myCarousel" data-slide="next">
<span class="glyphicon glyphicon-chevron-right"></span>
<span class="sr-only">Next</span></a>

</div>
</div>

<%@ include file="footer.jsp" %>