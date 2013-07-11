// prints a count of the total number of badges claimed via claim code.
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

print(unwoundCodeArray.length);