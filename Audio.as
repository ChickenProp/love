package {

import net.flashpunk.*;

public class Audio {
	[Embed(source = 'media/player-ow.mp3', mimeType = 'audio/mpeg')]
	private static const PLAYER_OW:Class;
	
	[Embed(source = 'media/player-yay.mp3', mimeType = 'audio/mpeg')]
	private static const PLAYER_YAY:Class;
	
	[Embed(source = 'media/player-die.mp3', mimeType = 'audio/mpeg')]
	private static const PLAYER_DIE:Class;
	
	[Embed(source = 'media/wife-ow.mp3', mimeType = 'audio/mpeg')]
	private static const WIFE_OW:Class;
	
	[Embed(source = 'media/wife-yay.mp3', mimeType = 'audio/mpeg')]
	private static const WIFE_YAY:Class;
	
	[Embed(source = 'media/wife-die.mp3', mimeType = 'audio/mpeg')]
	private static const WIFE_DIE:Class;
	
	public static var player_ow:Sfx = new Sfx(PLAYER_OW);
	public static var player_yay:Sfx = new Sfx(PLAYER_YAY);
	public static var player_die:Sfx = new Sfx(PLAYER_DIE);
	public static var wife_ow:Sfx = new Sfx(WIFE_OW);
	public static var wife_yay:Sfx = new Sfx(WIFE_YAY);
	public static var wife_die:Sfx = new Sfx(WIFE_DIE);
}
}
