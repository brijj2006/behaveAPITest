import requests
from behave import *
import json
from hamcrest import assert_that, equal_to
import psycopg2


@given(u'asset setup is done')
def step_impl(context):
    pass


@when(u'user checks quota for "{id}"')
def step_impl(context, id):
    print("\n", "id is ", id)

    post_body = {
        "custodianExternalUIN": "" + id + ""
    }
    url_post = "http://0.0.0.0:8000/custodian/quota/get"

    post_response = requests.post(url_post, json=post_body, headers={"Authorization": "valid-token-1"})
    # post_response_json = post_response.json()
    context.status_code = post_response.status_code
    context.headers = post_response.headers
    context.request = post_response.request.body
    context.content = json.loads(post_response.content)
    pass


@then(u'user details are fetched correctly')
def step_impl(context):
    # print('status_code : ', context.status_code, '\n')
    # print('headers : ', context.headers, '\n')
    # print('request : ', context.request, '\n')
    # print('content : ', context.content, '\n')
    assert_that(context.status_code, equal_to(int(200)))
    i = 0
    for row in context.table:
        assert_that(context.content['quota'][i]['categoryId'], equal_to(row['categoryId']))
        assert_that(context.content['quota'][i]['currentQuota'], equal_to(int(row['currentQuota'])))
        assert_that(context.content['quota'][i]['totalQuota'], equal_to(int(row['totalQuota'])))
        i = i + 1
