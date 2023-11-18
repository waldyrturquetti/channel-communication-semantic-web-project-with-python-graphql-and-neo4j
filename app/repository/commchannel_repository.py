import os

from dotenv import load_dotenv
from neo4j import GraphDatabase

load_dotenv()

uri = os.getenv("NEO4J_URI", "bolt://127.0.0.1:7687")
username = os.getenv("NEO4J_USER", "neo4j")
password = os.getenv("NEO4J_PASSWORD", "Str@ngPassword")
database = os.getenv("NEO4J_DATABASE", "neo4j")

class CommChannelRepository:
    def __init__(self):
        self.driver = GraphDatabase.driver(uri, auth=(username, password))

    def close(self):
        self.driver.close()

    @staticmethod
    def _get_user_commchannels(tx, name):
        nodes = tx.run("MATCH (u:User {name:$name})-[:HAVE]->(a)-[:USE]->(cc:ChannelCommunication) RETURN collect(distinct cc)", name=name)
        results = [record for record in nodes.data()]
        print(results[0]['collect(distinct cc)'])
        return results[0]['collect(distinct cc)']

    def get_user_commchannels(self, name):
        with self.driver.session() as session:
            commchannel = session.execute_read(self._get_user_commchannels, name)
            self.close()
            return commchannel

def serialize_commchannel(commchannel):
    serialize_dict, ret = {}, {}
    for i, cc in enumerate(commchannel):
        serialize_dict[f"cc{i}"] = cc["type"]
    ret["cc"] = serialize_dict
    print(ret)
    return commchannel