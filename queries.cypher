MATCH (n) RETURN n;

MATCH (u:User)-[r]->(c:Contact) RETURN u,c;

MATCH (u:User)-[r]->(c:Contact)-[n:HAVE]->(p) RETURN u,c,p;

MATCH (u:User)-[r]->(c:Contact)-[n:HAVE]->(p)-[t:USE]->(e) RETURN u,c,p,e;