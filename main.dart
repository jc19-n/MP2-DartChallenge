// Define the Song class
class Song {
  String title;
  String artist;
  int duration; // Duration in seconds

  // Constructor for Song class
  Song(this.title, this.artist, this.duration);

  // Method to display song details
  void display() {
    final minutes = duration ~/ 60;
    final seconds = duration % 60;
    print(
        '$title by $artist (${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')})');
  }
}

// Define the Playlist class
class Playlist {
  String name;
  List<Song> songs;

  // Constructor for Playlist class
  Playlist(this.name) : songs = [];

  // Add a song to the playlist
  void addSong(Song song) {
    songs.add(song);
  }

  // Display all songs in the playlist
  void displayPlaylist() {
    print('Playlist: $name');
    for (var song in songs) {
      song.display();
    }
  }

  // Method to sort songs by artist
  void sortByArtist() {
    songs.sort((a, b) => a.artist.compareTo(b.artist));
  }
}

// Define the MusicFestival class
class MusicFestival {
  String name;
  List<Playlist> stages;

  // Constructor for MusicFestival class
  MusicFestival(this.name) : stages = [];

  // Method to add a playlist to the festival
  void addStage(Playlist playlist) {
    stages.add(playlist);
  }

  // Calculate the total duration of the festival
  int totalFestivalDuration() {
    return stages.fold(
        0,
        (sum, playlist) =>
            sum +
            playlist.songs.fold(0, (songSum, song) => songSum + song.duration));
  }

  // Method to display all playlists in the festival
  void displayFestival() {
    print('Music Festival: $name');
    for (var stage in stages) {
      stage.displayPlaylist();
    }
  }
}

// Main function
void main() {
  // Songs create
  Song song1 = Song('Goodbyes', 'Post Malone', 306);
  Song song2 = Song('Circles', 'Post Malone', 336);
  Song song3 = Song('Better now', 'Post Malone', 352);
  Song song4 = Song('Go Flex', 'Post Malone', 332);
  Song song5 = Song('Lucis Dreams', 'Juice WRLD', 327);
  Song song6 = Song('Legends', 'Juice WRLD', 253);
  Song song7 = Song('All Girls Are The Same', 'Juice WRLD', 250);
  Song song8 = Song('Robbery', 'Juice WRLD', 338);
  Song song9 = Song('Paranoid', 'Post Malone', 342);
  Song song10 = Song('Sunflower', 'Post Malone', 242);

  // Playlists stage
  Playlist rockStage = Playlist('Rock Stage');
  Playlist indieStage = Playlist('Indie Stage');
  Playlist chillingandvibingStage = Playlist('Chilling and Vibing Stage');

  // Add songs to playlists
  rockStage.addSong(song1);
  rockStage.addSong(song4);
  rockStage.addSong(song5);
  rockStage.addSong(song6);
  rockStage.addSong(song7);
  rockStage.addSong(song8);
  rockStage.addSong(song9);
  rockStage.addSong(song10);

  indieStage.addSong(song2);

  chillingandvibingStage.addSong(song3);

  // Create a music festival and add the stages
  MusicFestival festival = MusicFestival('Posty WRLD');
  festival.addStage(rockStage);
  festival.addStage(indieStage);
  festival.addStage(chillingandvibingStage);

  // Display the total festival duration
  print('Total Duration: ${festival.totalFestivalDuration()} seconds');
  print("");
  // Display random songs
  print('Chill songs:');
  indieStage.songs[0].display();
  chillingandvibingStage.songs[0].display();
  rockStage.songs[0].display(); // Randomly selected song

  // Display Main Stage playlist
  rockStage.sortByArtist();
  print("");
  print('Main Stage playlist:');
  rockStage.displayPlaylist();
}
