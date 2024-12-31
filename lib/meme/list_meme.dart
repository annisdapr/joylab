class Meme {
  final String name;
  final String imageAsset;
  final String description;
  final String creator;
  final int year;
  bool isSaved;

  Meme({
    required this.name,
    required this.imageAsset,
    required this.description,
    required this.creator,
    required this.year,
    this.isSaved = false,
  });
}

var memeList = [
  Meme(
    name: 'school college run',
    imageAsset: 'images_meme/school college run.jpg',
    description: 'This meme humorously depicts the transition from school to college life, emphasizing the dramatic change in pace and responsibilities.',
    creator: 'Unknown',
    year: 2019,
  ),
  Meme(
    name: 'Stonks',
    imageAsset: 'images_meme/Stonks.png',
    description: 'This meme features a surreal image of a man in a suit in front of a stock market graph, humorously used to denote financial decisions or success.',
    creator: 'Special Meme Fresh',
    year: 2017,
  ),
  Meme(
    name: 'Write That Down!',
    imageAsset: 'images_meme/Write That Down.jpg',
    description: 'This meme shows a scene from "The SpongeBob Movie: Sponge Out of Water" where SpongeBob and Plankton frantically take notes, used to indicate taking mental or literal notes.',
    creator: 'Nickelodeon',
    year: 2015,
  ),
  Meme(
    name: 'Woody Buzz Regarde',
    imageAsset: 'images_meme/woody buzz regarde.jpg',
    description: 'This meme from "Toy Story" features Woody and Buzz Lightyear looking into the distance, often paired with captions like "X, X everywhere."',
    creator: 'Pixar',
    year: 1995,
  ),
  Meme(
    name: 'You Guys Are Getting Paid The Millers',
    imageAsset: 'images_meme/You Guys Are Getting Paid The Millers.jpg',
    description: 'This meme shows a character from "We\'re the Millers" reacting to surprising information, often used to express disbelief.',
    creator: 'Warner Bros.',
    year: 2013,
  ),
  Meme(
    name: 'Thinking You Cant',
    imageAsset: 'images_meme/thinking you cant.jpg',
    description: 'This meme features a contemplative character, often used to humorously depict overthinking or questionable logic.',
    creator: 'Unknown',
    year: 2018,
  ),
  Meme(
    name: 'Yellow glasses guy 2 panel',
    imageAsset: 'images_meme/Yellow glasses guy 2 panel.jpg',
    description: 'This meme features a two-panel comparison where the "Yellow Glasses Guy" mocks a choice or action, highlighting irony.',
    creator: 'Unknown',
    year: 2020,
  ),
  Meme(
    name: 'The office Michael Scott shaking',
    imageAsset: 'images_meme/The office Michael Scott shaking.png',
    description: 'This meme shows Michael Scott from "The Office" shaking hands, often used to depict an awkward or ironic agreement.',
    creator: 'NBC',
    year: 2009,
  ),
];
