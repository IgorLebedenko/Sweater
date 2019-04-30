<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
    <div>
        <@l.logout/>
        <span><a href="/users">List of users</a></span>
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
</@c.page>