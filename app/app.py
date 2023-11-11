from flask import Flask
from flask_graphql import GraphQLView

from schema.schema import schema
from repository.hello_worl_example import HelloWorldExample

app = Flask(__name__)
app.debug = True

app.add_url_rule(
    '/graphql',
    view_func=GraphQLView.as_view(
        'graphql',
        schema=schema,
        graphiql=True
    )
)

if __name__ == '__main__':
    app.run(port=8080)
    # greeter = HelloWorldExample("bolt://localhost:7687", "neo4j", "Str@ngPassword")
    # greeter.print_greeting("hello, world")
    # greeter.close()

