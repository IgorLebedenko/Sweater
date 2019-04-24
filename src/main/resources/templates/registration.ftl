<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sweater</title>
</head>
<body>
    ${message?ifExists}
    <div>Add new user:</div>
    <form action="/registration" method="post">
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
</body>
</html>