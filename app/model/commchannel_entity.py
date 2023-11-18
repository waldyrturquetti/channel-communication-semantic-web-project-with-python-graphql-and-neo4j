import graphene

class CommChannel(graphene.ObjectType):
    class Meta:
        interfaces = (graphene.relay.Node,)

    # id = graphene.ID()
    cc = graphene.List(graphene.JSONString)
