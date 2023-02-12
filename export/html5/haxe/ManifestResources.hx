package;


import haxe.io.Bytes;
import lime.utils.AssetBundle;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {


	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;


	public static function init (config:Dynamic):Void {

		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();

		rootPath = null;

		if (config != null && Reflect.hasField (config, "rootPath")) {

			rootPath = Reflect.field (config, "rootPath");

		}

		if (rootPath == null) {

			#if (ios || tvos || emscripten)
			rootPath = "assets/";
			#elseif android
			rootPath = "";
			#elseif console
			rootPath = lime.system.System.applicationDirectory;
			#else
			rootPath = "./";
			#end

		}

		#if (openfl && !flash && !display)
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		#end

		var data, manifest, library, bundle;

		#if kha

		null
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("null", library);

		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("null");

		#else

		data = '{"name":null,"assets":"aoy4:pathy34:assets%2Fdata%2Fdata-goes-here.txty4:sizezy4:typey4:TEXTy2:idR1y7:preloadtgoR0y36:assets%2Fdata%2Flevels%2Flevel1.jsonR2i3280R3R4R5R7R6tgoR0y36:assets%2Fdata%2Flevels%2Flevel2.jsonR2i3260R3R4R5R8R6tgoR0y36:assets%2Fdata%2Flevels%2Flevel3.jsonR2i3234R3R4R5R9R6tgoR0y36:assets%2Fdata%2Flevels%2Flevel4.jsonR2i3217R3R4R5R10R6tgoR0y36:assets%2Fdata%2Flevels%2Flevel5.jsonR2i3335R3R4R5R11R6tgoR0y34:assets%2Fdata%2Flevels%2Fmain.ogmoR2i7409R3R4R5R12R6tgoR0y24:assets%2Ffonts%2F5px.fntR2i11149R3R4R5R13R6tgoR0y26:assets%2Ffonts%2F5px_0.pngR2i976R3y5:IMAGER5R14R6tgoR0y24:assets%2Ffonts%2F8px.fntR2i11150R3R4R5R16R6tgoR0y26:assets%2Ffonts%2F8px_0.pngR2i1272R3R15R5R17R6tgoR0y29:assets%2Ffonts%2F8px_bold.fntR2i11163R3R4R5R18R6tgoR0y31:assets%2Ffonts%2F8px_bold_0.pngR2i1363R3R15R5R19R6tgoR0y25:assets%2Ffonts%2Fmini.fntR2i11147R3R4R5R20R6tgoR0y27:assets%2Ffonts%2Fmini_0.pngR2i1160R3R15R5R21R6tgoR0y28:assets%2Ffonts%2Fpreset.bmfcR2i884R3R4R5R22R6tgoR0y24:assets%2Ffonts%2Frev.fntR2i11146R3R4R5R23R6tgoR0y26:assets%2Ffonts%2Frev_0.pngR2i1117R3R15R5R24R6tgoR0y26:assets%2Fimages%2Farea.pngR2i163R3R15R5R25R6tgoR0y24:assets%2Fimages%2Fbg.pngR2i1027R3R15R5R26R6tgoR0y28:assets%2Fimages%2Fbouncy.pngR2i200R3R15R5R27R6tgoR0y26:assets%2Fimages%2Fdoor.pngR2i533R3R15R5R28R6tgoR0y36:assets%2Fimages%2Fimages-go-here.txtR2zR3R4R5R29R6tgoR0y26:assets%2Fimages%2Flogo.pngR2i1398R3R15R5R30R6tgoR0y28:assets%2Fimages%2Fmenubg.pngR2i923R3R15R5R31R6tgoR0y28:assets%2Fimages%2Fplayer.pngR2i660R3R15R5R32R6tgoR0y29:assets%2Fimages%2Fspecial.pngR2i380R3R15R5R33R6tgoR0y27:assets%2Fimages%2Fspike.pngR2i112R3R15R5R34R6tgoR0y27:assets%2Fimages%2Ftiles.pngR2i790R3R15R5R35R6tgoR0y32:assets%2Fimages%2Ftransition.pngR2i1588R3R15R5R36R6tgoR2i3726645R3y5:MUSICR5y26:assets%2Fmusic%2Floop1.mp3y9:pathGroupaR38y26:assets%2Fmusic%2Floop1.wavhR6tgoR2i21391152R3y5:SOUNDR5R40R39aR38R40hgoR2i1940804R3R37R5y26:assets%2Fmusic%2Floop2.mp3R39aR42y26:assets%2Fmusic%2Floop2.wavhR6tgoR2i11491528R3R41R5R43R39aR42R43hgoR0y36:assets%2Fmusic%2Fmusic-goes-here.txtR2zR3R4R5R44R6tgoR2i11430R3R37R5y26:assets%2Fsounds%2Fback.mp3R39aR45y26:assets%2Fsounds%2Fback.oggy26:assets%2Fsounds%2Fback.wavhR6tgoR2i12043R3R41R5R46R39aR45R46R47hgoR2i340496R3R41R5R47R39aR45R46R47hgoR2i15017R3R37R5y29:assets%2Fsounds%2Fconfirm.mp3R39aR48hR6tgoR0y36:assets%2Fsounds%2Fsounds-go-here.txtR2zR3R4R5R49R6tgoR2i5308R3R37R5y29:assets%2Fsounds%2Fstep-01.mp3R39aR50y29:assets%2Fsounds%2Fstep-01.ogghR6tgoR2i8650R3R41R5R51R39aR50R51hgoR2i4839R3R37R5y29:assets%2Fsounds%2Fstep-02.mp3R39aR52y29:assets%2Fsounds%2Fstep-02.ogghR6tgoR2i8214R3R41R5R53R39aR52R53hgoR2i4838R3R37R5y29:assets%2Fsounds%2Fstep-03.mp3R39aR54y29:assets%2Fsounds%2Fstep-03.ogghR6tgoR2i7899R3R41R5R55R39aR54R55hgoR2i2466R3R37R5y29:assets%2Fsounds%2Fstep-04.mp3R39aR56y29:assets%2Fsounds%2Fstep-04.ogghR6tgoR2i5883R3R41R5R57R39aR56R57hgoR2i3222R3R37R5y29:assets%2Fsounds%2Fstep-05.mp3R39aR58y29:assets%2Fsounds%2Fstep-05.ogghR6tgoR2i6792R3R41R5R59R39aR58R59hgoR2i2114R3R37R5y26:flixel%2Fsounds%2Fbeep.mp3R39aR60y26:flixel%2Fsounds%2Fbeep.ogghR6tgoR2i39706R3R37R5y28:flixel%2Fsounds%2Fflixel.mp3R39aR62y28:flixel%2Fsounds%2Fflixel.ogghR6tgoR2i5794R3R41R5R61R39aR60R61hgoR2i33629R3R41R5R63R39aR62R63hgoR2i15744R3y4:FONTy9:classNamey35:__ASSET__flixel_fonts_nokiafc22_ttfR5y30:flixel%2Ffonts%2Fnokiafc22.ttfR6tgoR2i29724R3R64R65y36:__ASSET__flixel_fonts_monsterrat_ttfR5y31:flixel%2Ffonts%2Fmonsterrat.ttfR6tgoR0y33:flixel%2Fimages%2Fui%2Fbutton.pngR2i519R3R15R5R70R6tgoR0y36:flixel%2Fimages%2Flogo%2Fdefault.pngR2i3280R3R15R5R71R6tgh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		

		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		

		#end

	}


}


#if kha

null

#else

#if !display
#if flash

@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_levels_level1_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_levels_level2_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_levels_level3_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_levels_level4_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_levels_level5_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_levels_main_ogmo extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_5px_fnt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_5px_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_8px_fnt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_8px_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_8px_bold_fnt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_8px_bold_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_mini_fnt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_mini_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_preset_bmfc extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_rev_fnt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_rev_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_area_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_bg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_bouncy_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_door_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_images_go_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_logo_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_menubg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_player_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_special_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_spike_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_tiles_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_transition_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_loop1_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_loop1_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_loop2_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_loop2_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_back_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_back_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_back_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_confirm_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_step_01_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_step_01_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_step_02_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_step_02_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_step_03_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_step_03_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_step_04_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_step_04_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_step_05_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_step_05_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:keep @:file("assets/data/data-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/data/levels/level1.json") @:noCompletion #if display private #end class __ASSET__assets_data_levels_level1_json extends haxe.io.Bytes {}
@:keep @:file("assets/data/levels/level2.json") @:noCompletion #if display private #end class __ASSET__assets_data_levels_level2_json extends haxe.io.Bytes {}
@:keep @:file("assets/data/levels/level3.json") @:noCompletion #if display private #end class __ASSET__assets_data_levels_level3_json extends haxe.io.Bytes {}
@:keep @:file("assets/data/levels/level4.json") @:noCompletion #if display private #end class __ASSET__assets_data_levels_level4_json extends haxe.io.Bytes {}
@:keep @:file("assets/data/levels/level5.json") @:noCompletion #if display private #end class __ASSET__assets_data_levels_level5_json extends haxe.io.Bytes {}
@:keep @:file("assets/data/levels/main.ogmo") @:noCompletion #if display private #end class __ASSET__assets_data_levels_main_ogmo extends haxe.io.Bytes {}
@:keep @:file("assets/fonts/5px.fnt") @:noCompletion #if display private #end class __ASSET__assets_fonts_5px_fnt extends haxe.io.Bytes {}
@:keep @:image("assets/fonts/5px_0.png") @:noCompletion #if display private #end class __ASSET__assets_fonts_5px_0_png extends lime.graphics.Image {}
@:keep @:file("assets/fonts/8px.fnt") @:noCompletion #if display private #end class __ASSET__assets_fonts_8px_fnt extends haxe.io.Bytes {}
@:keep @:image("assets/fonts/8px_0.png") @:noCompletion #if display private #end class __ASSET__assets_fonts_8px_0_png extends lime.graphics.Image {}
@:keep @:file("assets/fonts/8px_bold.fnt") @:noCompletion #if display private #end class __ASSET__assets_fonts_8px_bold_fnt extends haxe.io.Bytes {}
@:keep @:image("assets/fonts/8px_bold_0.png") @:noCompletion #if display private #end class __ASSET__assets_fonts_8px_bold_0_png extends lime.graphics.Image {}
@:keep @:file("assets/fonts/mini.fnt") @:noCompletion #if display private #end class __ASSET__assets_fonts_mini_fnt extends haxe.io.Bytes {}
@:keep @:image("assets/fonts/mini_0.png") @:noCompletion #if display private #end class __ASSET__assets_fonts_mini_0_png extends lime.graphics.Image {}
@:keep @:file("assets/fonts/preset.bmfc") @:noCompletion #if display private #end class __ASSET__assets_fonts_preset_bmfc extends haxe.io.Bytes {}
@:keep @:file("assets/fonts/rev.fnt") @:noCompletion #if display private #end class __ASSET__assets_fonts_rev_fnt extends haxe.io.Bytes {}
@:keep @:image("assets/fonts/rev_0.png") @:noCompletion #if display private #end class __ASSET__assets_fonts_rev_0_png extends lime.graphics.Image {}
@:keep @:image("assets/images/area.png") @:noCompletion #if display private #end class __ASSET__assets_images_area_png extends lime.graphics.Image {}
@:keep @:image("assets/images/bg.png") @:noCompletion #if display private #end class __ASSET__assets_images_bg_png extends lime.graphics.Image {}
@:keep @:image("assets/images/bouncy.png") @:noCompletion #if display private #end class __ASSET__assets_images_bouncy_png extends lime.graphics.Image {}
@:keep @:image("assets/images/door.png") @:noCompletion #if display private #end class __ASSET__assets_images_door_png extends lime.graphics.Image {}
@:keep @:file("assets/images/images-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_images_images_go_here_txt extends haxe.io.Bytes {}
@:keep @:image("assets/images/logo.png") @:noCompletion #if display private #end class __ASSET__assets_images_logo_png extends lime.graphics.Image {}
@:keep @:image("assets/images/menubg.png") @:noCompletion #if display private #end class __ASSET__assets_images_menubg_png extends lime.graphics.Image {}
@:keep @:image("assets/images/player.png") @:noCompletion #if display private #end class __ASSET__assets_images_player_png extends lime.graphics.Image {}
@:keep @:image("assets/images/special.png") @:noCompletion #if display private #end class __ASSET__assets_images_special_png extends lime.graphics.Image {}
@:keep @:image("assets/images/spike.png") @:noCompletion #if display private #end class __ASSET__assets_images_spike_png extends lime.graphics.Image {}
@:keep @:image("assets/images/tiles.png") @:noCompletion #if display private #end class __ASSET__assets_images_tiles_png extends lime.graphics.Image {}
@:keep @:image("assets/images/transition.png") @:noCompletion #if display private #end class __ASSET__assets_images_transition_png extends lime.graphics.Image {}
@:keep @:file("assets/music/loop1.mp3") @:noCompletion #if display private #end class __ASSET__assets_music_loop1_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/music/loop1.wav") @:noCompletion #if display private #end class __ASSET__assets_music_loop1_wav extends haxe.io.Bytes {}
@:keep @:file("assets/music/loop2.mp3") @:noCompletion #if display private #end class __ASSET__assets_music_loop2_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/music/loop2.wav") @:noCompletion #if display private #end class __ASSET__assets_music_loop2_wav extends haxe.io.Bytes {}
@:keep @:file("assets/music/music-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/back.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_back_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/back.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_back_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/back.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_back_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/confirm.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_confirm_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/sounds-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/step-01.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_step_01_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/step-01.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_step_01_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/step-02.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_step_02_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/step-02.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_step_02_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/step-03.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_step_03_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/step-03.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_step_03_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/step-04.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_step_04_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/step-04.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_step_04_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/step-05.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_step_05_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/step-05.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_step_05_ogg extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/5,2,1/assets/sounds/beep.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/5,2,1/assets/sounds/flixel.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/5,2,1/assets/sounds/beep.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/5,2,1/assets/sounds/flixel.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends haxe.io.Bytes {}
@:keep @:font("export/html5/obj/webfont/nokiafc22.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:keep @:font("export/html5/obj/webfont/monsterrat.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel/5,2,1/assets/images/ui/button.png") @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel/5,2,1/assets/images/logo/default.png") @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}
@:keep @:file("") @:noCompletion #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else

@:keep @:expose('__ASSET__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/nokiafc22"; #else ascender = 2048; descender = -512; height = 2816; numGlyphs = 172; underlinePosition = -640; underlineThickness = 256; unitsPerEM = 2048; #end name = "Nokia Cellphone FC Small"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/monsterrat"; #else ascender = 968; descender = -251; height = 1219; numGlyphs = 263; underlinePosition = -150; underlineThickness = 50; unitsPerEM = 1000; #end name = "Monsterrat"; super (); }}


#end

#if (openfl && !flash)

#if html5
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#else
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#end

#end
#end

#end
