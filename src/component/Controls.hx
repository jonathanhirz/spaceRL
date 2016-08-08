package component;

import luxe.Component;
import luxe.Sprite;
import luxe.Input;

import entity.Ship;

class Controls extends Component {

    var attached_entity : Ship;

    override function init() {

        attached_entity = cast entity;

    } //init

    override function update( dt:Float ) {

        //todo: touch controls, and such

    } //update

} //Controls