import 'dart:io';

class InstagramStoriesPostRepostory {
  static List<String>? fetchInstagramPosts() {
    List<String> instagramPost = [];
    try {
      for (int i = 0; i < 30; i++) {
        instagramPost.add('https://source.unsplash.com/random/$i');
      }
      return instagramPost;
    } on SocketException {
      return null;
    } on Exception {
      return null;
    }
  }

  static List<String>? fetchInstagramStories() {
    List<String> instagramStories = [];
    try {
      for (int i = 0; i < 30; i++) {
        instagramStories.add('https://source.unsplash.com/random/$i');
      }

      return instagramStories;
    } on SocketException {
      return null;
    } on Exception {
      return null;
    }
  }
}
