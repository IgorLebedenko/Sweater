<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>Sweater</title>
</head>
<body>
    <div>
        <form method="post" action="/add">
            <input type="text" name="text" placeholder="Enter message"/>
            <input type="text" name="tag" placeholder="Enter tag"/>
            <button type="submit">Save</button>
        </form>
    </div>

    <div>
        <form method="get" action="/main">
            <input type="text" name="filter" value="${filter?ifExists}" placeholder="Filter tag"/>
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
            </div>
        <#else>
            No messages(
        </#list>
    </div>

</body>
</html>