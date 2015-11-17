(: Web Services RESTXQ para el módulo de Administrador :)
xquery version '3.0';
module namespace page = "http://udem.edu.co/portal-co-creacion";
import module namespace session = "http://basex.org/modules/session";


(: Borrar Problema :)
declare 
%rest:path("problem/{$pid}")
%rest:DELETE
updating function page:borrar-problema($pid)
{
  let $nombreProblema := concat($pid, '.xml')
  return
   if(db:exists('problem', $nombreProblema)) then
    (db:delete('problem',$nombreProblema),
    db:output('Problema eliminado'))
  else
    db:output('El problema no existe')
};

(: Borrar Solucion :)
declare 
%rest:path("problem/{$pid}/solution/{$sid}")
%rest:POST
%rest:produces("text/html" )
%output:method("html")
updating function page:borrar-solucion($pid, $sid){
  let $nombreProblema := concat($pid, '.xml')
  let $ruta := concat('problem/',$pid, '.xml')
  return
   if(db:exists('problem', $nombreProblema)) then
    (delete node doc($ruta)/problem/solution[position()=$sid],
    db:output('Problema eliminado'))
  else
    db:output('El problema no existe')
};

