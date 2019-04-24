<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>Sweater</title>
</head>
<body>
    <div>
        <form action="/logout" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button type="submit">Sign out</button>
        </form>
    </div>

    <div>
        <form action="/add" method="post">
            <input type="text" name="text" placeholder="Enter message"/>
            <input type="text" name="tag" placeholder="Enter tag"/>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button type="submit">Save</button>
        </form>
    </div>

    <div>
        <form action="/main" method="get">
            <input type="text" name="filter" value="${filter?ifExists}" placeholder="Filter tag"/>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button type="submit">Search by tag</button>
        </form>
    </div>

    <div>Message list:</div>
    <div>
        <#list messages as message>
            <div>
                <b>${message.id}</b>
                <span>${message.text}</span>
                <i>${message.tag}</i>
                <strong>${(message.author.username)!"&lt;none&gt;"}</strong>
            </div>
        <#else>
            No messages(
        </#list>
    </div>

</body>
</html>