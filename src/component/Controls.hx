package component;

import luxe.Component;
import luxe.Sprite;
import luxe.Vector;
import luxe.Input;

import entity.Ship;

class Controls extends Component {

    var attached_entity : Ship;
    var ship_speed : Float = 5.5;

    var touches : Array<TouchEvent>;
    var movement_touch : TouchEvent;
    var movement_touch_initial_position : Vector = new Vector(0,0);
    var movement_touch_icon : Sprite;

    override function init() {

        attached_entity = cast entity;
        touches = [];

        movement_touch_icon = new Sprite({ 
            texture : Luxe.resources.texture('assets/movement_touch_icon.png'),
            size : new Vector(64,64),
            pos : new Vector(0,0),
            visible : false,
            batcher : Main.hud_batcher
        });

    } //init

    override function update( dt:Float ) {

        //====TOUCH CONTROLS====
        if(touches.length > 0) {
            for(touch in touches) {
                //do stuff (? what was this for ?)
                //todo: add fix for second touch breaking movement_touch
            }
        }
        if(movement_touch != null) {
            var touch_y = movement_touch.pos.y - movement_touch_initial_position.y;
            var touch_x = movement_touch.pos.x - movement_touch_initial_position.x;
            attached_entity.acceleration.x = touch_x * ship_speed;
            attached_entity.acceleration.y = touch_y * ship_speed;

            attached_entity.start_exhaust();
            if(touches.length == 0) {
                attached_entity.acceleration.x = 0;
                attached_entity.acceleration.y = 0;
                attached_entity.stop_exhaust();
            } //stop ship
        }

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

        // portrait, one button controls
        touches.push(e);
        movement_touch = e;
        movement_touch_initial_position = movement_touch.pos.clone();

        // touch location indicator
        movement_touch_icon.pos.set_xy(movement_touch.pos.x * Luxe.screen.w, movement_touch.pos.y * Luxe.screen.h);
        movement_touch_icon.visible = true;

    } //ontouchdown

    override function ontouchmove( e:TouchEvent ) {

        for(touch in touches) {
            if(touch.touch_id == e.touch_id) {
                touch.pos.set_xy(e.pos.x, e.pos.y);
            }
        }

    } //ontouchmoved

    override function ontouchup( e:TouchEvent ) {

        // portrait, one button controls
        for(touch in touches) {
            if(touch.touch_id == e.touch_id) {
                touches.remove(touch);
            }
        }

        // touch location indicator
        movement_touch_icon.visible = false;

    } //ontouchup

} //Controls