(: Cada modulo debe tener un namespace :)
xquery version '3.0';
module namespace page = "http://udem.edu.co/portal-co-creacion";
import module namespace session = "http://basex.org/modules/session";

(:***************** Solución *****************:)

(: Crear solución :)
declare 
%rest:path("problem/{$pid}/solution") 
%rest:POST( '{$solucion}')
updating function page:guardar-solucion($pid, $solucion){
	let $current_session := session:get('user')
	let $nombre := concat($pid, '.xml')
	let $new :=  <solution xmlns="">
				    <creation-date>{current-dateTime()}</creation-date>
				    <title>{$solucion//title/text()}</title>
				    <description>{$solucion//description/text()}</description>
				    <user>{$current_session//user/text()}</user>
				  </solution>
	let $ruta := concat( 'problem/',$nombre)
	return if (db:exists( 'problem', $nombre )) then
			(insert node $new into collection($ruta)/problem, db:output('Solución agregada'))
		else
		(db:output('El problema no existe')) 
};

(: Obtener solucion:)
declare 
%rest:path("problem/{$pid}/solution/{$sid}") 
%rest:GET 
%rest:produces("text/xml", "application/xml" )
%output:method("xml")
function page:get-problem-solution-xml($pid, $sid) {
	let $nombre := concat('problem/',$pid, '.xml')
	let $problem := doc($nombre)/problem/solution[position()=$sid]
	return $problem
};

(:Actualizar solucion:)
declare 
%rest:path("problem/{$pid}/solution/{$sid}")
%rest:PUT('{$solucion}')
updating function page:actualizar-solucion($pid, $solucion, $sid)
{
  let $p := doc( concat('data/',$pid,'.xml') )
  let $sol := $p/problem/solution[position()=$sid]
  return replace node $sol with $sol/$solucion
};

(:***************** Valoracion solucion *****************:)

(:Crear valoracion de solucion:) 
declare 
%rest:path("problem/{$pid}/solution/{$sid}/review") 
%rest:POST( '{$review}')
updating function page:guardar-solucion-review($pid, $sid, $review ){
	let $current_session := session:get('user')
	let $nombre := concat($pid, '.xml')
	let $new := <review xmlns="">
			      <creation-date>{current-dateTime()}</creation-date>
			      <user>{$current_session//user/text()}</user>
			      <ranking>{$review//ranking/text()}</ranking>
			      <comment>{$review//comment/text()}</comment>
			    </review>
	let $ruta := concat( 'problem/',$nombre)
	return if (db:exists( 'problem', $nombre )) then
			(insert node $new into collection($ruta)/problem/solution[position()=$sid], db:output('Valoración de la solucion agregada'))
		else
		(db:output('El problema no existe')) 
};


(:Obetener valoraciones de una solucion :)
declare 
%rest:path("problem/{$pid}/solution/{$sid}/review") 
%rest:GET 
%rest:produces("text/xml", "application/xml" )
%output:method("xml")
function page:get-solution-review-xml($pid, $sid) {
let $p := doc( concat('problem/',$pid,'.xml') )(: Requerido para correcta visualzación en el navegador:)
let $reviews := <reviews> 
				{$p/problem/solution[position()=$sid]/review}
				</reviews>
return $reviews
};


(:Actualizar valoracion de solucion:)
declare 
%rest:path("problem/{$pid}/solution/{$sid}/review/{$rid}")
%rest:PUT('{$review}')
updating function page:actualizar-solucion-review($pid, $review, $sid, $rid)
{
  let $p := doc( concat('problem/',$pid,'.xml') )
  let $rev := $p/problem/solution[position()=$sid]/review[position()=$rid]
  return replace node $rev with $rev/$review
};



