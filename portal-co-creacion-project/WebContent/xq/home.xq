xquery version '3.0';
module namespace page = "http://udem.edu.co/portal-co-creacion";

declare %rest:path('home')
%rest:GET
%rest:produces("text/html")
%output:method("html")
%output:version("5.0")


function page:get-home-html(){  
  let $problem-info := collection("problem")/problem
  return
  <html>
    <head>
      <title>HOME</title>
      <meta http-equiv="Refresh" content="url=list-problem"></meta>
      <meta http-equiv="Refresh" content="url=problem"></meta>
      <meta http-equiv="Refresh" content="url=solution"></meta>	  
    <script type = "text/javascript" src = "/static/problem/js/funciones.js"></script> 
    <script type = "text/javascript" src = "/static/problem/js/busqueda.js"></script>
    <script type = "text/javascript" src = "/static/problem/js/problema.js"></script>
	<script type="text/javascript" src="/static/problem/js/carga.js"></script>
	<link href='http://fonts.googleapis.com/css?family=Ubuntu+Condensed' rel='stylesheet' type='text/css'/>
	<link href="/static/problem/css/styles.css" rel="stylesheet" type="text/css" />
	  <script type = "text/javascript">
		<![CDATA[/**/		
		function searchIt(){
				var combo = document.getElementsByName('SelectOptionForSearch')[0];
				var text = document.getElementsByName('searchTxt')[0].value;
				var url = 'search/';
				if(combo.selectedIndex <= 0){
					document.getElementsByName('divNotify')[0].innerHTML = "por favor selecciona algo.";
					document.getElementsByName('divNotify')[0].style.display = 'block';
					return;
				}
				if(text == ''){
					document.getElementsByName('divNotify')[0].innerHTML = "por favor escribe algo.";
					document.getElementsByName('divNotify')[0].style.display = 'block';
					return;
				}
				if(combo.value == 'H1'){
					url += 'problem/';
				}
				if(combo.value == 'H2'){
					url += 'solution/';
				}
				url += text;
				window.location = url;
			}
		/*]]>*/
	  </script>
	 
    </head>
    <body>
	<div class="wrapper">
    <div class="logo-menu-container">
    <div class="logo">SOLUCIONES</div>
    <div class="menu">
      <ul>
        <li><a href="#" class="active" >Inicio</a></li>
        <li><a href="#">Problemas</a></li>
      </ul>
    </div>
  </div>
	
	    <div class="searchform-container">
		<div class="searchform-content">Problemas</div>
		<div class="search">
        <div class="search-input">
        <input type="text" name="search" class="search-input-textfield" />
        </div>
        <div class="search-icon"><a href="#"><img src="/static/problem/images/search-icon.png" alt="search" /></a></div>
		</div>
		</div>
		 <div class="clear"></div>
		 
		 
  <div class="page">
	 <div class="main-banner"><img src="/static/problem/images/banner.jpg" alt="banner" /></div>
	     <div class="left-column">
      <div class="dark-panel">
	  
        <div class="dark-panel-top"></div>
        <div class="dark-panel-center">
          <ul>
            <li>
              <h1>Sign In</h1>
            </li>
            <li>
              <p>Si quieres comentar o publicar inicia session</p>
            </li>
			  <form name = "formLogin" class = "loginForm" method = "GET" action = "">
       
            <li class="username">
			<input name="userid" class = "textField" type = "text" name = "txtUser" placeholder = "Usuario"></input>
            </li>
            <li class="password">
			<input name="passcode" class = "textField" type = "password" name = "txtPw" placeholder = "Contraseña"></input>
            </li>
            <li class="button"><button  class = "btnToggle" type = "button" onclick = "">Ingresa</button>
            <button  class = "btnToggle" type = "button" onclick = "">Registrate</button></li>
          </ul>
        </div>
		 </form>
        <div class="dark-panel-bottom"></div>
      </div>
      <div class="light-panel">
        <div class="light-panel-top"></div>
        <div class="light-panel-center">
          <h1>Informacion</h1>
          <ul>
            <li><a href="https://www.google.com.co/">+ como solucionar tus problemas</a></li>
            <li><a href="http://img.desmotivaciones.es/201103/Tetona1.jpg">+ Evitando el suicidio</a></li>
            <li><a href="http://m.memegen.com/ltp2li.jpg">+ Como ganar la ciencia basica</a></li>
            <li><a href="http://m.memegen.com/ltp2li.jpg">+ Soluciones</a></li>
            <li><a href="http://m.memegen.com/ltp2li.jpg">+ Confusio</a></li>
            <li><a href="http://m.memegen.com/ltp2li.jpg">+ Suspender la pereza</a></li>
            <li class="no-border"><a href="http://m.memegen.com/ltp2li.jpg">+ sin...no hay paraiso</a></li>
          </ul>
        </div>
        <div class="light-panel-bottom"></div>
      </div>
      <div class="dark-panel">
        <div class="dark-panel-top"></div>
        <div class="dark-panel-center">
          <ul>
            <li>
              <h1>Aenean euctus</h1>
            </li>
            <li class="date">09-21-2015</li>
            <li class="news">Encontrar la cura para el cancer.</li>
            <li class="date">06-17-2015</li>
            <li class="news">Encontrar la cura para la pereza.</li>
            <li class="date">02-08-2015</li>
            <li class="news-no-border">como evitar que los ñeros dominen el mundo.</li>
          </ul>
        </div>
        <div class="dark-panel-bottom"></div>
      </div>
    </div>
 <div class="right-column">
 <div class="right-column-content">
 
 		<table>
		<tr>
		<td class= "a1">
      <nav>
        <div><a href="list-problem">Ver todos los problemas</a></div>
        <form name ="formFinder" method = "GET">
		<div>
			  <select name = "SelectOptionForSearch">
			  <option value = "default" selected = "selected"> selecciona algo</option> 
				<option value = "H1">buscar problemas</option>
				<option value = "H2">buscar soluciones</option>
			  </select> 
		</div>		
        <div name = "divNotify" style = "display: none;"></div>
		<div>
			<input type = "text" class = "textField" name = "searchTxt" placeholder = "Busca por el nombre"></input>
		 </div>
		 <div>
			<button class = "btnToggle" type = "button" onclick = "searchIt()">search</button>
		 </div>
        </form>
      </nav>
	  </td>
	  <td class="a2">	  
      <article>	  
      {
        let $result := for $better in $problem-info
                          let $ranking := avg($better/review/ranking/text())
                          order by $ranking descending
                          return $better  
        for $x at $pos in $result where $pos <= 3
          return <div class = "Problem" onclick = "showProblem('{$x/title/text()}')"><br></br>
                   {string("Problema compartido por: ")}<b>{$x/user/text()}</b>                 
                   <div class = "Title"><b>{$x/title/text()}</b></div>
                   <div class = "Description">{$x/description/text()}</div>
                   <div class = "Ranking">{string("Puntuacion: ")}<b>{avg($x/review/ranking/text())}</b></div>
                 </div>
      }
      </article>	  
	  </td>
	  </tr>
	  </table>
	    </div>
 </div><div class="footer-wrapper">
  <div class="footer-top"></div>
  <div class="footer-center">
    <div class="footer-content-left">
      <h1>Info contacto</h1>
      <h2>Porfavor solo usar esta informacion en caso de emergencia</h2>
      <p>nos tomamos el derecho a no contestar nunca. </p>
      <p>si es para donaciones llame tres veces. </p>
    </div>
    <div class="footer-content-right">
      <h1>Universidad de medellin</h1>
      <h2>Topicos especiales en algoritmos</h2>
      <p>elaborado con fines academicos</p>
      <h3>Email: info@untitled.com</h3>
      <h3>Phone: (800) 555-0000</h3>
    </div>
  </div>
  <div class="footer-bottom"></div>
</div>
<div class="clear"></div>
<div class="copyrights">Copyright (c)  <div class="copyrights-bottom"></div></div>
 

	</div>
	</div>
  </body>
</html>
};

declare %rest:path("home")
%rest:GET
%output:method("json")
%output:json("format=jsonml")
%rest:produces("text/json")
function page:get-home-json(){
  let $problem-info := collection("problem")/problem
  let $result := for $better in $problem-info
                          let $ranking := avg($better/review/ranking/text())
                          order by $ranking descending
                          return $better  
  return
      <json type='object'>
        {for $x at $pos in $result where $pos <= 3
          return $x}
      </json>
};

declare %rest:path("home")
%rest:GET
%rest:produces("text/xml", "application/xml")
%output:method("xml")
function page:get-home-xml(){
  let $problem-info := collection("problem")/problem
  return <xml type='object'>{
     let $result := for $better in $problem-info
                          let $ranking := avg($better/review/ranking/text())
                          order by $ranking descending
                          return $better  
     for $x at $pos in $result where $pos <= 3
          return $x
  }</xml>
};