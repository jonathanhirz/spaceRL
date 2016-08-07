package component;

import luxe.Component;
import luxe.Sprite;

class Controls extends Component {

    var attached_entity : Sprite;

    override function init() {

        attached_entity = cast entity;

    } //init

    override function update(dt:Float) {

        //todo: touch controls, and such

    } //update

} //Controls