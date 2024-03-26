import requests
from behave import *


@given(u'asset setup is done')
def step_impl(context):
    pass


@when(u'user checks quota for "{id}"')
def step_impl(context, id):
    print("id is ", id)

    post_body = {
        "custodianExternalUIN": "S0000007A"
    }
    url_post = "http://0.0.0.0:8000/custodian/quota/get"

    post_response = requests.post(url_post, json=post_body, headers={"Authorization": "valid-token-1"})

    post_response_json = post_response.json()
    print(post_response_json)

    pass


@then(u'user details are fetched correctly')
def step_impl(context):
    pass
