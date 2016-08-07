package entity;

import luxe.Sprite;
import luxe.Vector;

import component.Controls;
import component.ScrollingBackground;

class Ship extends Sprite {

    public function new() {

        super({
            name : 'ship',
            texture : Luxe.resources.texture('assets/blue_ship.png'),
            size : new Vector(64, 64),
            pos : Luxe.screen.mid
        });

        add(new Controls());
        add(new ScrollingBackground());

    } //new

} //Ship