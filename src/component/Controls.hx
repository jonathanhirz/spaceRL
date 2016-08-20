package component;

import luxe.Component;
import luxe.Sprite;
import luxe.Vector;
import luxe.Input;

import entity.Ship;

class Controls extends Component {

    var attached_entity : Ship;
    var touches : Array<TouchEvent>;
    var ship_speed : Float = 1.5;

    override function init() {

        attached_entity = cast entity;

    } //init

    override function update( dt:Float ) {

        //todo: touch controls, and such

        //====KEY CONTROLS====
        if(Luxe.input.inputdown('up')) {
            attached_entity.acceleration.y = -ship_speed;
            attached_entity.start_exhaust();
        }
        if(Luxe.input.inputreleased('up')) {
            attached_entity.acceleration.y = 0;
            attached_entity.stop_exhaust();
        }
        if(Luxe.input.inputdown('down')) {
            attached_entity.acceleration.y = ship_speed;
            attached_entity.start_exhaust();
        }
        if(Luxe.input.inputreleased('down')) {
            attached_entity.acceleration.y = 0;
            attached_entity.stop_exhaust();
        }
        if(Luxe.input.inputdown('left')) {
            attached_entity.acceleration.x = -ship_speed;
            attached_entity.start_exhaust();
        }
        if(Luxe.input.inputreleased('left')) {
            attached_entity.acceleration.x = 0;
            attached_entity.stop_exhaust();
        }
        if(Luxe.input.inputdown('right')) {
            attached_entity.acceleration.x = ship_speed;
            attached_entity.start_exhaust();
        }
        if(Luxe.input.inputreleased('right')) {
            attached_entity.acceleration.x = 0;
            attached_entity.stop_exhaust();
        }
        if(Luxe.input.inputpressed('space')) {
            attached_entity.velocity = new Vector(0,0);
            attached_entity.stop_exhaust();
        }

    } //update

    override function ontouchdown( e:TouchEvent ) {


    } //ontouchdown

    override function ontouchmove( e:TouchEvent ) {


    } //ontouchmoved

    override function ontouchup( e:TouchEvent ) {


    } //ontouchup

} //Controls