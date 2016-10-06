package entity;

import luxe.Sprite;
import luxe.Vector;

class Asteroid extends Sprite {
    
    public function new( _x:Int, _y:Int ) {

        super({
            name : 'asteroid',
            name_unique : true,
            texture : Luxe.resources.texture('assets/asteroid.png'),
            pos : new Vector(_x, _y)
        });

    } //new

    override function update( dt:Float ) {


    } //update


} //Asteroid