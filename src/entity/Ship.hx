package entity;

import luxe.Sprite;
import luxe.Vector;
import luxe.components.sprite.SpriteAnimation;
import luxe.utils.Maths;

import component.Controls;
import component.ScrollingBackground;

class Ship extends Sprite {

    var velocity : Vector = new Vector(0,0);
    var acceleration : Vector = new Vector(0,0);

    var max_velocity : Float = 10;
    var movement_rate : Float = 1.5;
    
    var ship_exhaust_anim : SpriteAnimation;
    var ship_exhaust_anim_2 : SpriteAnimation;

    public function new() {

        super({
            name : 'ship',
            texture : Luxe.resources.texture('assets/blue_ship.png'),
            size : new Vector(64, 64),
            pos : Luxe.screen.mid
        });

        // add components
        add(new Controls());
        add(new ScrollingBackground());

        // exhaust animation
        // exhaust 1 sprite
        var ship_exhaust = new Sprite({
            name : "ship_exhaust",
            texture : Luxe.resources.texture('assets/exhaust.png'),
            size : new Vector(16, 32),
            rotation_z : 180,
            pos : new Vector(16, 64),
            depth : 2
        });
        ship_exhaust.parent = this;
        // exhaust 1 animation
        var exhaust_anim = Luxe.resources.json('assets/exhaust.json');
        ship_exhaust_anim = ship_exhaust.add(new SpriteAnimation({ name:'exhaust' }));
        ship_exhaust_anim.add_from_json_object(exhaust_anim.asset.json);
        ship_exhaust_anim.animation = 'idle';
        ship_exhaust_anim.play();

        // exhaust 2 sprite
        var ship_exhaust_2 = new Sprite({
            name : "ship_exhaust_2",
            texture : Luxe.resources.texture('assets/exhaust.png'),
            size : new Vector(16, 32),
            rotation_z : 180,
            pos : new Vector(48, 64),
            depth : 2
        });
        ship_exhaust_2.parent = this;
        // exhaust 2 animation
        var exhaust_anim_2 = Luxe.resources.json('assets/exhaust.json');
        ship_exhaust_anim_2 = ship_exhaust_2.add(new SpriteAnimation({ name:'exhaust' }));
        ship_exhaust_anim_2.add_from_json_object(exhaust_anim.asset.json);
        ship_exhaust_anim_2.animation = 'idle';
        ship_exhaust_anim_2.play();

    } //new

    override function update( dt:Float ) {

        velocity.add(acceleration);
        velocity.x = luxe.utils.Maths.clamp(velocity.x, -max_velocity, max_velocity);
        velocity.y = luxe.utils.Maths.clamp(velocity.y, -max_velocity, max_velocity);
        pos.add(velocity);
        velocity.multiply(new Vector(0.99, 0.99));
        if(velocity.x != 0 || velocity.y != 0) {
            this.rotation_z = Math.atan2(velocity.y, velocity.x) * (180/Math.PI) + 90;
        }

    } //update

    public function start_exhaust() {

        if(ship_exhaust_anim.animation != 'fire') {
            ship_exhaust_anim.animation = 'fire';
            ship_exhaust_anim_2.animation = 'fire';
        }

    } //start_exhaust

    public function stop_exhaust() {

        ship_exhaust_anim.animation = 'idle';
        ship_exhaust_anim_2.animation = 'idle';

    } //stop_exhaust

} //Ship