# #2 Karate Framework - Read JSONObject and JSONArray
# https://www.youtube.com/watch?v=SfX-nTP6wRM&list=PLFGoYjJG_fqpUgFYoKIMZJAblUbGHSQAb&index=2
Feature: json feature testing

Scenario: json reader parser

    * def jsonObject =
    """
    [
        {
            "name": "Jerry",
            "city": "Salvador",
            "age" : 25
        },
        {
            "name": "Pedro",
            "city" : "São Paulo",
            "age": 35
        }
    ]
    """

    * print jsonObject
    * print jsonObject[0]
    * print jsonObject[0].name
    * print jsonObject[1].name + " "+ jsonObject[1].city + " " + jsonObject[1].age

Scenario: complex json reader

    * def jsonObject =
    """
    {"menu": {
            "id": "file",
            "value": "File",
            "popup": {
                "menuitem": [
                    {"value": "New", "onclick": "CreateNewDoc()"},
                    {"value": "Open", "onclick": "OpenDoc()"},
                    {"value": "Close", "onclick": "CloseDoc()"}
                ]
            }
        }
    }
    """
    * print jsonObject
    * print jsonObject.menu.id
    * print jsonObject.menu.popup
    * print jsonObject.menu.popup.menuitem
    * print jsonObject.menu.popup.menuitem[0].value
    * print jsonObject.menu.popup.menuitem[0].onclick