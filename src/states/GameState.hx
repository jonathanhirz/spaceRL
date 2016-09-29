package states;
import luxe.States;
import luxe.Screen;
import luxe.Camera;
import luxe.Color;
import luxe.Vector;
import luxe.Sprite;
import luxe.Parcel;
import luxe.ParcelProgress;

import entity.Ship;

class GameState extends State {

    var ship : Ship;

    public function new( _name:String ) {
        super({ name:_name });
    } //new

    override function init() {

        // parcel to load our assets for the game_state
        var parcel = new Parcel({
            textures : [
                { id : 'assets/blue_ship.png' },
                { id : 'assets/exhaust.png' },
                { id : 'assets/star_background.png' },
                { id : 'assets/star_background_back.png' },
                { id : 'assets/movement_touch_icon.png' }
             ],
             jsons : [
                { id : 'assets/exhaust.json'}
            ]
        });

        //todo: make ParcelProgress look custom
        new ParcelProgress({
            parcel : parcel,
            background : new Color().rgb(0x1a1a1a),
            oncomplete : assets_loaded
        });

        parcel.load();


    } //init

    function assets_loaded(_) {

        ship = new Ship();
        //todo: new entity - asteroids, or something to shoot at

    } //assets_loaded

    override function onenter<T>( _value:T ) {


    } //onenter

    override function onleave<T>( _value:T ) {


    } //onleave

    override function update( dt:Float ) {

        if(ship != null) {
            Luxe.camera.center.weighted_average_xy(ship.pos.x, ship.pos.y, 1);
        }

    } //update

    override function onwindowsized( e:WindowEvent ) {

        Luxe.camera.size = new Vector(Luxe.screen.w, Luxe.screen.h);
        ship.pos = Luxe.screen.mid;

    } //onwindowresized

} //GameState