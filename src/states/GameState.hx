package states;
import luxe.States;
import luxe.Screen;
import luxe.Camera;
import luxe.Color;
import luxe.Vector;
import luxe.Sprite;
import luxe.Parcel;
import luxe.ParcelProgress;
import luxe.Text;

import entity.Ship;
import entity.Asteroid;

class GameState extends State {

    var ship : Ship;
    var position_text : Text;

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
                { id : 'assets/movement_touch_icon.png' },
                { id : 'assets/asteroid.png' }
             ],
             jsons : [
                { id : 'assets/exhaust.json' }
            ],
            fonts : [
                { id : 'assets/inconsolata.fnt' }
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

        position_text = new Text({
            font : Luxe.resources.font('assets/inconsolata.fnt'),
            text : "X: " + Std.int(ship.pos.x/10) + "\nY: " + Std.int(-ship.pos.y/10),
            pos : new Vector(20, 20),
            batcher : Main.hud_batcher
        });

        var testteroid = new Asteroid(800,50);

    } //assets_loaded

    override function onenter<T>( _value:T ) {


    } //onenter

    override function onleave<T>( _value:T ) {


    } //onleave

    override function update( dt:Float ) {

        if(ship != null) Luxe.camera.center.weighted_average_xy(ship.pos.x, ship.pos.y, 1);
        if(position_text != null) position_text.text = "X: " + Std.int(ship.pos.x/10) + "\nY: " + Std.int(-ship.pos.y/10);

    } //update

    override function onwindowsized( e:WindowEvent ) {

        Luxe.camera.size = new Vector(Luxe.screen.w, Luxe.screen.h);
        Main.hud_view.size = new Vector(Luxe.screen.w, Luxe.screen.h);
        ship.pos = Luxe.screen.mid;

    } //onwindowresized

} //GameState