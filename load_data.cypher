// Load communication channel
// This is an initialization script for the communication channel graph.
// Run it only once. ;)

// Clean Database
MATCH (n) DETACH DELETE n;

// Nodes Creation
CREATE (Julio:User {name:'Julio', Gender:'Male', Birthday:'28-09-1999', BornCountry:'Brazil', Height:'1,76'});
CREATE (Waldyr:User {name:'Waldyr', Gender:'Male', Birthday:'30-12-1999', BornCountry:'Brazil', Height:'1,80'});
CREATE (Della:User {name:'Della', Gender:'Female', Birthday:'28-09-1999', BornCountry:'Cape Verde', Height:'1,76'});
CREATE (Joao:Contact {type:'Person', name:'Joao', Gender:'Male', Birthday:'28-09-1970', BornCountry:'Brazil', Height:'1,76'});
CREATE (`Jú`:Contact {type:'Person', name:'Jú', Gender:'Male', Birthday:'30-12-1960', BornCountry:'Brazil', Height:'1,70'});
CREATE (`+5512912341234`:PhoneNumber {country_id:'+55', number:'12912341234'});
CREATE (`+5512912341235`:PhoneNumber {country_id:'+55', number:'12912341235'});
CREATE (`+5512912341236`:PhoneNumber {country_id:'+55', number:'12912341236'});
CREATE (`+5512912341237`:PhoneNumber {country_id:'+351', number:'12912341237'});
CREATE (`+5512912341238`:PhoneNumber {country_id:'+351', number:'12912341238'});
CREATE (`julio1@email.com`:`E-Mail` {email:'julio1@email.com'});
CREATE (`julio2@utfpr.com`:`E-Mail` {email:'julio2@utfpr.com'});
CREATE (`waldyr@email.com`:`E-Mail` {email:'waldyr@email.com'});
CREATE (`della@email.com`:`E-Mail` {email:'della@email.com'});
CREATE (Instagram:Application {app_name:'Instagram'});
CREATE (WhatsApp:Application {app_name:'WhatsApp'});
CREATE (Email:ChannelCommunication {type:'E-mail'});
CREATE (SMS:ChannelCommunication {type:'SMS'});
CREATE (PushNotification:ChannelCommunication {type:'PushNotification'});
CREATE (DirectMessage:ChannelCommunication {type:'DirectMessage'});
CREATE (Publication:ChannelCommunication {type:'Publication'});
CREATE (BirthdayParty:Event {title:'Birthday Party',nature:'Social', type:'Presencial', startdate:'2023-12-14T17:30:00', enddate:'2023-12-14T21:00:00', place:'Users Home', context:'Celebrating a users birthday with friends and family'});
CREATE (TeamMeeting:Event {title:'Team Meeting',nature:'Professional', type:'Online', startdate:'2023-11-18T10:00:00', enddate:'2023-11-18T12:00:00', place:'Teams', context:'Discussion of projects and planning tasks for the week.'});
CREATE (LiveConcert:Event {title:'Live Concert',nature:'Cultural', type:'Presencial', startdate:'2023-12-20T20:30:00', enddate:'2023-12-20T22:30:00', place:'Concert Arena', context:'Live performance by a famous band'});
CREATE (OnlineProgrammingWorkshop:Event {title:'Online Programming Workshop',nature:'Educational', type:'Online', startdate:'2023-11-20T14:30:00', enddate:'2023-11-20T17:30:00', place:'zoom', context:'Practical session to learn new programming techniques'});
CREATE (SendPicture:Action {type:'Send picture'});
CREATE (SendVoiceMessage:Action {type:'Send Voice Message'});
CREATE (SendTextMessage:Action {type:'Send Text Message'});
CREATE (CreatePublication:Action {type:'Create Publication'});
CREATE (ShareFile:Action {type:'Share File'});


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
CREATE (Julio)-[:HAVE {preference_weight:0.9}]->(`julio1@email.com`);


MATCH
(Julio:User {name:'Julio'}),
(`julio2@utfpr.com`:`E-Mail` {email:'julio2@utfpr.com'})
CREATE (Julio)-[:HAVE {preference_weight:0.6}]->(`julio2@utfpr.com`);


MATCH
(Della:User {name:'Della'}),
(`della@email.com`:`E-Mail` {email:'della@email.com'})
CREATE (Della)-[:HAVE {preference_weight:1}]->(`della@email.com`);


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
CREATE (Julio)-[:HAVE {preference_weight:0.8}]->(`+5512912341236`);


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
CREATE (Julio)-[:HAVE {preference_weight:0.6}]->(Instagram);


MATCH
(Instagram:Application {app_name:'Instagram'}),
(PushNotification:ChannelCommunication {type:'PushNotification'})
CREATE (Instagram)-[:USE]->(PushNotification);


MATCH
(Instagram:Application {app_name:'Instagram'}),
(DirectMessage:ChannelCommunication {type:'DirectMessage'})
CREATE (Instagram)-[:USE]->(DirectMessage);


MATCH
(Della:User {name:'Della'}),
(WhatsApp:Application {app_name:'WhatsApp'})
CREATE (Della)-[:HAVE {preference_weight:1}]->(WhatsApp);


MATCH
(WhatsApp:Application {app_name:'WhatsApp'}),
(PushNotification:ChannelCommunication {type:'PushNotification'})
CREATE (WhatsApp)-[:USE]->(PushNotification);


MATCH
(WhatsApp:Application {app_name:'WhatsApp'}),
(DirectMessage:ChannelCommunication {type:'DirectMessage'})
CREATE (WhatsApp)-[:USE]->(DirectMessage);


MATCH
(Instagram:Application {app_name:'Instagram'}),
(Publication:ChannelCommunication {type:'Publication'})
CREATE (Instagram)-[:USE]->(Publication);


MATCH
(Della:User {name:'Della'}),
(SendPicture:Action {type:'Send picture'})
CREATE (Della)-[:PERFORM_ACTION {count:1}]->(SendPicture);


MATCH
(WhatsApp:Application {app_name:'WhatsApp'}),
(SendPicture:Action {type:'Send picture'})
CREATE (SendPicture)-[:USING]->(WhatsApp);


MATCH
(DirectMessage:ChannelCommunication {type:'DirectMessage'}),
(SendPicture:Action {type:'Send picture'})
CREATE (SendPicture)-[:THROUGH_A]->(DirectMessage);


MATCH
(Julio:User {name:'Julio'}),
(ShareFile:Action {type:'Share File'})
CREATE (Julio)-[:PERFORM_ACTION {count:1}]->(ShareFile);


MATCH
(WhatsApp:Application {app_name:'WhatsApp'}),
(ShareFile:Action {type:'Share File'})
CREATE (ShareFile)-[:USING]->(WhatsApp);


MATCH
(DirectMessage:ChannelCommunication {type:'DirectMessage'}),
(ShareFile:Action {type:'Share File'})
CREATE (ShareFile)-[:THROUGH_A]->(DirectMessage);


MATCH
(Julio:User {name:'Julio'}),
(SendTextMessage:Action {type:'Send Text Message'})
CREATE (Julio)-[:PERFORM_ACTION {count:1}]->(SendTextMessage);


MATCH
(WhatsApp:Application {app_name:'WhatsApp'}),
(SendTextMessage:Action {type:'Send Text Message'})
CREATE (SendTextMessage)-[:USING]->(WhatsApp);


MATCH
(DirectMessage:ChannelCommunication {type:'DirectMessage'}),
(SendTextMessage:Action {type:'Send Text Message'})
CREATE (SendTextMessage)-[:THROUGH_A]->(DirectMessage);


MATCH
(Julio:User {name:'Julio'}),
(WhatsApp:Application {app_name:'WhatsApp'})
CREATE (Julio)-[:HAVE {preference_weight:1}]->(WhatsApp);


MATCH
(Julio:User {name:'Julio'}),
(SendVoiceMessage:Action {type:'Send Voice Message'})
CREATE (Julio)-[:PERFORM_ACTION {count:1}]->(SendVoiceMessage);


MATCH
(WhatsApp:Application {app_name:'WhatsApp'}),
(SendVoiceMessage:Action {type:'Send Voice Message'})
CREATE (SendVoiceMessage)-[:USING]->(WhatsApp);


MATCH
(DirectMessage:ChannelCommunication {type:'DirectMessage'}),
(SendVoiceMessage:Action {type:'Send Voice Message'})
CREATE (SendVoiceMessage)-[:THROUGH_A]->(DirectMessage);


MATCH
(LiveConcert:Event {title:'Live Concert'}),
(CreatePublication:Action {type:'Create Publication'})
CREATE (LiveConcert)-[:PERFORM_ACTION {count:1}]->(CreatePublication);


MATCH
(LiveConcert:Event {title:'Live Concert'}),
(Instagram:Application {app_name:'Instagram'})
CREATE (LiveConcert)-[:USE]->(Instagram);


MATCH
(Instagram:Application {app_name:'Instagram'}),
(CreatePublication:Action {type:'Create Publication'})
CREATE (CreatePublication)-[:USING]->(Instagram);


MATCH
(Publication:ChannelCommunication {type:'Publication'}),
(CreatePublication:Action {type:'Create Publication'})
CREATE (CreatePublication)-[:THROUGH_A]->(Publication);


MATCH
(Della:User {name:'Della'}), (BirthdayParty:Event {title: "Birthday Party"})
CREATE (Della)-[:WAS_IN]->(BirthdayParty);


MATCH
(Julio:User {name:'Julio'}), (TeamMeeting:Event {title:'Team Meeting'})
CREATE (Julio)-[:WAS_IN]->(TeamMeeting);


MATCH
(Waldyr:User {name:'Waldyr'}), (LiveConcert:Event {title:'Live Concert'})
CREATE (Waldyr)-[:WAS_IN]->(LiveConcert);


MATCH
(Julio:User {name:'Julio'}), (OnlineProgrammingWorkshop:Event {title:'Online Programming Workshop'})
CREATE (Julio)-[:WAS_IN]->(OnlineProgrammingWorkshop);
