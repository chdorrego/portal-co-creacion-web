(: Cada modulo debe tener un namespace :)
xquery version '3.0';
module namespace page = "http://udem.edu.co/portal-co-creacion";
import module namespace session = "http://basex.org/modules/session";

(:Crear problema:)
declare 
%rest:path("problem") 
%rest:POST( '{$problema}') 
updating function page:crear-problema($problema )
{
	let $current_session := session:get('user')
	let $pid := $problema//id
	let $nombre := concat($pid, '.xml' )
	let $new := <problem>
					<creation-date>{current-dateTime()}</creation-date>
					<id>{$pid/text()}</id>
					<category>{$problema//category/text()}</category>
					<title>{$problema//title/text()}</title>
					<description>{$problema//description/text()}</description>
					<user>{$current_session//user/text()}</user>
				</problem>

	return if (db:exists( 'problem', $nombre ) ) then
		(db:replace("problem", $nombre, $new),db:output('Problema remplazado'))
	else
	(db:add("problem", $new, $nombre),db:output('Problema creado')) 
};

(:Servicio para agregar el comentario a el problema :)
declare 
%rest:path("problem/{$pid}/review") 
%rest:POST( '{$review}')
updating function page:review-problem($pid, $review ){
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
			(insert node $new into collection($ruta)/problem, db:output('Valoración agregada'))
		else
		(db:output('El problema no existe')) 
};

(: Obtener problema :)
declare 
%rest:path("problem/{$id}") 
%rest:GET 
%rest:produces("text/xml", "application/xml" )
%output:method("xml")
function page:get-problem-xml($id) {
let $p := doc(concat('problem/',$id,'.xml') )
return $p
};





