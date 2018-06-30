import 'dart:async';
import 'dart:html' as html;
import 'package:stagexl/stagexl.dart';
import 'dart:math';

Future<Null> main() async {
  StageOptions options = new StageOptions()// What can you do w/ stage
    ..backgroundColor = Color.Black
    ..renderEngine = RenderEngine.WebGL //this is the same as saving options.etc
    ..inputEventMode = InputEventMode.MouseOnly; //How can users trigger events?

  var canvas = html.querySelector('#stage'); //Creates canvas object/instantiate -- Where and how big is cancas
  var stage = new Stage(canvas, width: 1100, height: 1100, options: options); // passing options to stage! fundamental of stage instantiation

  var renderLoop = new RenderLoop(); // creats a loop that details ibject movement through a stream. Starts at isntantiation, not start needed. can stop and start though, but it would restart the entire stream
  renderLoop.addStage(stage);

  var resourceManager = new ResourceManager(); // What objects are actually being manipulated
  resourceManager.addBitmapData("map", "images/map.jpg");
  resourceManager.addBitmapData("star", "images/star.png");

  await resourceManager.load(); //tells program to wait until everything is loaded b4 proceeding

  var mapData = resourceManager.getBitmapData("map");
  var starData = resourceManager.getBitmapData("star");

  var map = new Sprite();
  map.addChild(new Bitmap(mapData));
//
  map.pivotX = mapData.width / 2;
  map.pivotY = mapData.height / 2;
//
  // Place it at center.
  map.x = 1100 / 2;
    map.y = 1100/2;
  
  stage.addChild(map);



  Sprite cadstar = new Sprite(); //todo: Rename variable types
  //todo: Break into several Readable Methods! Like build Gui and

  cadstar
    ..addChild(new Bitmap(starData))
    ..height=50
    ..width=50
    ..pivotX = starData.width / 2
    ..pivotY = starData.height / 2
    ..x=382
    ..y=387;

  stage.addChild(cadstar);
  cadstar;

Sprite usstar = new Sprite(); //todo: Rename variable types
                              //todo: Break into several Readable Methods! Like build Gui and
usstar
  ..addChild(new Bitmap(starData))
  ..height=50
  ..width=50
  ..pivotX = starData.width / 2
  ..pivotY = starData.height / 2
  ..x=352
  ..y=604;

  stage.addChild(usstar);



  Sprite mexstar = new Sprite();
  mexstar
    ..addChild(new Bitmap(starData))
    ..height=50
    ..width=50
    ..pivotX = starData.width / 2
    ..pivotY = starData.height / 2
    ..x=384
    ..y=787;

  stage.addChild(mexstar);

// Place it at top center.map.x = 1100 / 2;map.y = 1100/2;

 // stage.addChild(map);




//  // And let it fall.
//  var tween = stage.juggler.addTween(map, 3, Transition.easeOutBounce);
//  tween.animate.y.to(800 / 2);
//
  // Add some interaction on mouse click.
//  Tween rotation;
//  map.onMouseClick.listen((MouseEvent e) {
//    // Don't run more rotations at the same time.
//    if (rotation != null) return;
//    rotation = stage.juggler.//addTween(map, 0.5, Transition.easeInOutCubic);
//    rotation.animate.rotation.by(2 * PI);
//    rotation.onComplete = () => rotation = null;
//  });
  map.mouseCursor = MouseCursor.POINTER;

  // See more examples:
  // https://github.com/bp74/StageXL_Samples
}
