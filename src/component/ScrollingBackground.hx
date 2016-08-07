package component;

import luxe.Component;
import luxe.Sprite;

class ScrollingBackground extends Component {

    var attached_entity : Sprite;

    override function init() {

        attached_entity = cast entity;
        //todo: initialize multiple star backgrounds

    } //init

    override function update(dt:Float) {

        //todo: move background with attached_entity

    } //update

} //ScrollingBackground