// Load communication channel
// This is an initialization script for the communication channel graph.
// Run it only once. ;)


//Use `MATCH (n) DETACH DELETE n` to start over.


// Nodes Creation
CREATE (Julio:User {name:'Julio', Gender:'Male', Birthday:'28-09-1999', BornCountry:'Brazil', Height:'1,76'});
CREATE (Waldyr:User {name:'Waldyr', Gender:'Male', Birthday:'30-12-1999', BornCountry:'Brazil', Height:'1,80'});
CREATE (Della:User {name:'Della', Gender:'Female', Birthday:'28-09-1999', BornCountry:'Cape Verde', Height:'1,76'});
CREATE (Joao:Contact {type:'Person', name:'Joao', Gender:'Male', Birthday:'28-09-1970', BornCountry:'Brazil', Height:'1,76'});
CREATE (`Jú`:Contact {name:'Jú', Gender:'Male', Birthday:'30-12-1960', BornCountry:'Brazil', Height:'1,70'});
CREATE (`+5512912341234`:PhoneNumber {country_id:'+55', number:'12912341234'});
CREATE (`+5512912341235`:PhoneNumber {country_id:'+55', number:'12912341235'});
CREATE (`+5512912341236`:PhoneNumber {country_id:'+55', number:'12912341236'});
CREATE (`+5512912341237`:PhoneNumber {country_id:'+351', number:'12912341237'});
CREATE (`+5512912341238`:PhoneNumber {country_id:'+351', number:'12912341238'});
CREATE (`julio1@email.com`:`E-Mail` {email:'julio1@email.com'});
CREATE (`julio2@utfpr.com`:`E-Mail` {email:'julio2@utfpr.com'});
CREATE (`waldyr@email.com`:`E-Mail` {email:'waldyr@email.com'});
CREATE (`della@email.com`:`E-Mail` {email:'della@email.com'});
CREATE (`ju@email.com`:`E-Mail` {email:'ju@email.com'});
CREATE (Instagram:Application {app_name:'Instagram'});
CREATE (Email:ChannelCommunication {type:'E-mail'});
CREATE (SMS:ChannelCommunication {type:'SMS'});
CREATE (PushNotification:ChannelCommunication {type:'Push Notification'});


// Relationship Creation
MATCH
(Julio:User {name:'Julio'}),
(Joao:Contact {name:'Joao'})
CREATE (Julio)-[:IS_SON {affection_weight:1}]->(Joao);


MATCH
(Julio:User {name:'Julio'}),
(Joao:Contact {name:'Joao'})
CREATE (Joao)-[:IS_FATHER {affection_weight:1}]->(Julio);


MATCH
(Waldyr:User {name:'Waldyr'}),
(`Jú`:Contact {name:'Jú'})
CREATE (Waldyr)-[:IS_NEPHEW {affection_weight:0.8}]->(`Jú`);


MATCH
(Waldyr:User {name:'Waldyr'}),
(`Jú`:Contact {name:'Jú'})
CREATE (`Jú`)-[:IS_UNCLE {affection_weight:0.8}]->(Waldyr);


MATCH
(Waldyr:User {name:'Waldyr'}),
(`waldyr@email.com`:`E-Mail` {email:'waldyr@email.com'})
CREATE (Waldyr)-[:HAVE {preference_weight:1}]->(`waldyr@email.com`);


MATCH
(Julio:User {name:'Julio'}),
(`julio1@email.com`:`E-Mail` {email:'julio1@email.com'})
CREATE (Julio)-[:HAVE {preference_weight:1}]->(`julio1@email.com`);


MATCH
(Julio:User {name:'Julio'}),
(`julio2@utfpr.com`:`E-Mail` {email:'julio2@utfpr.com'})
CREATE (Julio)-[:HAVE {preference_weight:0.6}]->(`julio2@utfpr.com`);


MATCH
(Della:User {name:'Della'}),
(`della@email.com`:`E-Mail` {email:'della@email.com'})
CREATE (Della)-[:HAVE {preference_weight:1}]->(`della@email.com`);

MATCH
(Ju:Contact {name:'Jú'}),
(`ju@email.com`:`E-Mail` {email:'ju@email.com'})
CREATE (Ju)-[:HAVE {preference_weight:1}]->(`ju@email.com`);

MATCH
(Waldyr:User {name:'Waldyr'}),
(`+5512912341234`:PhoneNumber {country_id:'+55', number:'12912341234'})
CREATE (Waldyr)-[:HAVE {preference_weight:1}]->(`+5512912341234`);


MATCH
(Joao:Contact {name:'Joao'}),
(`+5512912341235`:PhoneNumber {country_id:'+55', number:'12912341235'})
CREATE (Joao)-[:HAVE {preference_weight:1}]->(`+5512912341235`);


MATCH
(Julio:User {name:'Julio'}),
(`+5512912341236`:PhoneNumber {country_id:'+55', number:'12912341236'})
CREATE (Julio)-[:HAVE {preference_weight:1}]->(`+5512912341236`);


MATCH
(Della:User {name:'Della'}),
(`+5512912341237`:PhoneNumber {country_id:'+351', number:'12912341237'})
CREATE (Della)-[:HAVE {preference_weight:1}]->(`+5512912341237`);


MATCH
(Della:User {name:'Della'}),
(`+5512912341238`:PhoneNumber {country_id:'+351', number:'12912341238'})
CREATE (Della)-[:HAVE {preference_weight:1}]->(`+5512912341238`);


MATCH
(Email:ChannelCommunication {type:'E-mail'}),
(`julio1@email.com`:`E-Mail` {email:'julio1@email.com'})
CREATE (`julio1@email.com`)-[:USE]->(Email);


MATCH
(Email:ChannelCommunication {type:'E-mail'}),
(`julio2@utfpr.com`:`E-Mail` {email:'julio2@utfpr.com'})
CREATE (`julio2@utfpr.com`)-[:USE]->(Email);


MATCH
(Email:ChannelCommunication {type:'E-mail'}),
(`waldyr@email.com`:`E-Mail` {email:'waldyr@email.com'})
CREATE (`waldyr@email.com`)-[:USE]->(Email);


MATCH
(Email:ChannelCommunication {type:'E-mail'}),
(`della@email.com`:`E-Mail` {email:'della@email.com'})
CREATE (`della@email.com`)-[:USE]->(Email);

MATCH
(Email:ChannelCommunication {type:'E-mail'}),
(`ju@email.com`:`E-Mail` {email:'ju@email.com'})
CREATE (`ju@email.com`)-[:USE]->(Email);


MATCH
(`+5512912341234`:PhoneNumber {country_id:'+55', number:'12912341234'}),
(SMS:ChannelCommunication {type:'SMS'})
CREATE (`+5512912341234`)-[:USE]->(SMS);


MATCH
(`+5512912341235`:PhoneNumber {country_id:'+55', number:'12912341235'}),
(SMS:ChannelCommunication {type:'SMS'})
CREATE (`+5512912341235`)-[:USE]->(SMS);


MATCH
(`+5512912341236`:PhoneNumber {country_id:'+55', number:'12912341236'}),
(SMS:ChannelCommunication {type:'SMS'})
CREATE (`+5512912341236`)-[:USE]->(SMS);


MATCH
(`+5512912341237`:PhoneNumber {country_id:'+351', number:'12912341237'}),
(SMS:ChannelCommunication {type:'SMS'})
CREATE (`+5512912341237`)-[:USE]->(SMS);


MATCH
(`+5512912341238`:PhoneNumber {country_id:'+351', number:'12912341238'}),
(SMS:ChannelCommunication {type:'SMS'})
CREATE (`+5512912341238`)-[:USE]->(SMS);


MATCH
(Julio:User {name:'Julio'}),
(Instagram:Application {app_name:'Instagram'})
CREATE (Julio)-[:USE]->(Instagram);


MATCH
(Instagram:Application {app_name:'Instagram'}),
(PushNotification:ChannelCommunication {type:'Push Notification'})
CREATE (Instagram)-[:USE]->(PushNotification);
