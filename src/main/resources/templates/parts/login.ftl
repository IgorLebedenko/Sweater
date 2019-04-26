<#macro login path>
    <form action=${path} method="post">
        <div>
            <label>Username:</label>
            <div>
                <input type="text" name="username"/>
            </div>
        </div>
        <div>
            <label>Password:</label>
            <div>
                <input type="password" name="password"/>
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button type="submit">Sign in</button>
    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button type="submit">Sign out</button>
    </form>
</#macro>
