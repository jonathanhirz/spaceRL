package component;

import luxe.Component;
import luxe.Sprite;
import luxe.Vector;
import phoenix.Texture.ClampType;

import entity.Ship;

class ScrollingBackground extends Component {

    var attached_entity : Ship;
    var star_background : Sprite;
    var star_background_back : Sprite;

    override function init() {

        attached_entity = cast entity;

        // create two background sprites to scroll around
        star_background = new Sprite({
            name : 'star_background',
            texture : Luxe.resources.texture('assets/star_background.png'),
            pos : new Vector(0,0),
            depth : -1
        });
        star_background.texture.clamp_s = star_background.texture.clamp_t = ClampType.repeat;

        star_background_back = new Sprite({
            name : 'star_background_back',
            texture : Luxe.resources.texture('assets/star_background_back.png'),
            pos : new Vector(0,0),
            depth : -2
        });
        star_background_back.texture.clamp_s = star_background_back.texture.clamp_t = ClampType.repeat;

    } //init

    override function update( dt:Float ) {

        //move background with attached_entity
        //todo: tweak scrolling so it doesn't look so fake. maybe slower?
        star_background.pos = attached_entity.pos.clone();
        star_background_back.pos = attached_entity.pos.clone();
        star_background.uv.x = attached_entity.pos.x / 2;
        star_background.uv.y = attached_entity.pos.y / 2;
        star_background_back.uv.x = attached_entity.pos.x / 4;
        star_background_back.uv.y = attached_entity.pos.y / 4;

    } //update

} //ScrollingBackground