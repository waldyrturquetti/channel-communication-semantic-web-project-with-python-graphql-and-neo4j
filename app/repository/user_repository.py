import os

from dotenv import load_dotenv
from neo4j import GraphDatabase

load_dotenv()

uri = os.getenv("NEO4J_URI", "bolt://127.0.0.1:7687")
username = os.getenv("NEO4J_USER", "neo4j")
password = os.getenv("NEO4J_PASSWORD", "Str@ngPassword")
database = os.getenv("NEO4J_DATABASE", "neo4j")

class UserRepository:
    def __init__(self):
        self.driver = GraphDatabase.driver(uri, auth=(username, password))

    def close(self):
        self.driver.close()

    @staticmethod
    def _get_user_by_name(tx, name):
        nodes = tx.run("MATCH (x:User) WHERE x.name = $name RETURN x", name=name)
        results = [record for record in nodes.data()]
        return serialize_user(results[0]['x'])

    def get_user_by_name(self, name):
        with self.driver.session() as session:
            user = session.execute_read(self._get_user_by_name, name)
            self.close()
            return user

    @staticmethod
    def _get_user_commchannels(tx, name):
        nodes = tx.run("MATCH (x:User) WHERE x.name = $name RETURN x", name=name)
        results = [record for record in nodes.data()]
        return serialize_user(results[0]['x'])

    def get_user_commchannels(self, name):
        with self.driver.session() as session:
            user = session.execute_read(self._get_user_by_name, name)
            self.close()
            return user

def serialize_user(user):
    return {
        "name": user["name"],
        "birthday": user["Birthday"],
        "born_country": user["BornCountry"],
        "gender": user["Gender"],
        "height": user["Height"],
    }