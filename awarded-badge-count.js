// prints a count of the total number of badges awarded directly by CSOL or iRemix
// run on the openbadger database

var pipeline = [ 
                 {'$project' : { claimCodes : 1, _id : 0 } },
                 { '$unwind' : '$claimCodes' } , 
                 { '$match' : { 'claimCodes.claimedBy' : { $exists : true } } },
                 { '$group' : { _id : '$claimCodes.code' } } ,
               ];
               
var unwoundCodes = db.badges.aggregate(pipeline);

var unwoundCodeArray = [];

unwoundCodes.result.forEach( function (code) {
    unwoundCodeArray.push(code._id);
} );

var numClaimedBadges = unwoundCodeArray.length;

var steamBadges = db.badges.distinct( "_id", {"categoryAward" : { $nin: ["", null] } } );

var nonSteamBadgeCount = db.badgeinstances.count( {"badge" : { $nin : steamBadges } } );

print(nonSteamBadgeCount - numClaimedBadges);