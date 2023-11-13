import os

from flask import Flask, redirect
from flask_graphql import GraphQLView
from dotenv import load_dotenv

from app.schema.schema import schema
from repository.hello_worl_example import HelloWorldExample

load_dotenv()

app = Flask(__name__)
app.debug = True

uri = os.getenv("NEO4J_URI", "bolt://127.0.0.1:7687")
username = os.getenv("NEO4J_USER", "neo4j")
password = os.getenv("NEO4J_PASSWORD", "Str@ngPassword")
database = os.getenv("NEO4J_DATABASE", "neo4j")

port = int(os.getenv("PORT", 8080))

app.add_url_rule(
    '/graphql',
    view_func=GraphQLView.as_view(
        'graphql',
        schema=schema,
        graphiql=True
    )
)

@app.route('/')
def default_route():
    return redirect('/graphql', code=302)

if __name__ == '__main__':
    app.run(port=port)
