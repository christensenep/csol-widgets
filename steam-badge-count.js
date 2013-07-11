// prints a count of the total number of STEAM badges earned.
// run on the openbadger database

var steamBadges = db.badges.distinct( "_id", {"categoryAward" : { $nin: ["", null] } } );

printjson(db.badgeinstances.count( {"badge" : { $in : steamBadges } } ));