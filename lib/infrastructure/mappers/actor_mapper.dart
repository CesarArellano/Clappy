import '../../config/constants/image_placeholders.dart';
import '../../config/constants/tmdb_image.dart';
import '../../domain/entities/actor.dart';
import '../models/moviedb/credits_reponse.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) => Actor(
    id: cast.id,
    name: cast.name,
    character: cast.character,
    profilePath: cast.profilePath != null
        ? '${TmdbImage.baseUrlW500}${cast.profilePath}'
        : ImagePlaceholders.noProfileImage,
  );
}
